@extends('layouts.app')
@section('title', __('Jadwal Kunjungan Sales'))

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header no-print">
        <h1  class="tw-text-xl md:tw-text-3xl tw-font-bold tw-text-black">@lang('Jadwal Kunjungan Sales')
        </h1>
    </section>

    <!-- Main content -->
    <section class="content no-print">
        @component('components.filters', ['title' => __('report.filters')])
            @include('sales_admin.partials.visit_list_filters')            
        @endcomponent
        @component('components.widget', ['class' => 'box-primary', 'title' => __('Daftar Kunjungan')])
            @can('direct_sell.access')
                @slot('tool')
                    <div class="box-tools">
                        <a class="tw-dw-btn tw-bg-gradient-to-r tw-from-indigo-600 tw-to-blue-500 tw-font-bold tw-text-white tw-border-none tw-rounded-full pull-right"
                            href="{{ action([\App\Http\Controllers\SalesAdminController::class, 'create_visit']) }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M12 5l0 14" />
                                <path d="M5 12l14 0" />
                            </svg> @lang('messages.add')
                        </a>
                    </div>
                @endslot
            @endcan
            @if (auth()->user()->can('direct_sell.view') ||
                    auth()->user()->can('view_own_sell_only') ||
                    auth()->user()->can('view_commission_agent_sell'))
                @php
                    $custom_labels = json_decode(session('business.custom_labels'), true);
                @endphp
                <table class="table table-bordered table-striped ajax_view" id="sell_table">
                    <thead>
                        <tr>
                            <!-- <th>@lang('messages.action')</th> -->
                            <th>@lang('Nama Sales')</th>
                            <th>@lang('Tanggal Kunjungan')</th>
                            <th>@lang('sale.customer_name')</th>
                            <th>@lang('Alamat')</th>
                            <th>@lang('lang_v1.contact_no')</th>
                            <th>@lang('Status Kunjungan')</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            @endif
        @endcomponent
    </section>
    <!-- /.content -->
    <div class="modal fade payment_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    </div>

    <div class="modal fade edit_payment_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    </div>

    <!-- This will be printed -->
    <section class="invoice print_section" id="receipt_section">
        </section> 

@stop

@section('javascript')
    <script type="text/javascript">
        $(document).ready(function() {
            //Date range as a button
            $('#sell_list_filter_date_range').daterangepicker(
                dateRangeSettings,
                function(start, end) {
                    $('#sell_list_filter_date_range').val(start.format(moment_date_format) + ' ~ ' + end.format(
                        moment_date_format));
                    sell_table.ajax.reload();
                }
            );
            $('#sell_list_filter_date_range').on('cancel.daterangepicker', function(ev, picker) {
                $('#sell_list_filter_date_range').val('');
                sell_table.ajax.reload();
            });

            sell_table = $('#sell_table').DataTable({
                processing: true,
                serverSide: true,
                fixedHeader:false,
                aaSorting: [
                    [1, 'desc']
                ],
                "ajax": {
                    "url": "/sales-admin/sales-visit",
                    "data": function(d) {
                        if ($('#sell_list_filter_date_range').val()) {
                            var start = $('#sell_list_filter_date_range').data('daterangepicker')
                                .startDate.format('YYYY-MM-DD');
                            var end = $('#sell_list_filter_date_range').data('daterangepicker').endDate
                                .format('YYYY-MM-DD');
                            d.start_date = start;
                            d.end_date = end;
                        }
                        d.is_direct_sale = 1;

                        d.location_id = $('#sell_list_filter_location_id').val();
                        d.customer_id = $('#sell_list_filter_customer_id').val();
                        d.payment_status = $('#sell_list_filter_payment_status').val();
                        d.created_by = $('#created_by').val();
                        d.sales_cmsn_agnt = $('#sales_cmsn_agnt').val();
                        d.service_staffs = $('#service_staffs').val();

                        if ($('#shipping_status').length) {
                            d.shipping_status = $('#shipping_status').val();
                        }

                        if ($('#sell_list_filter_source').length) {
                            d.source = $('#sell_list_filter_source').val();
                        }

                        if ($('#only_subscriptions').is(':checked')) {
                            d.only_subscriptions = 1;
                        }

                        if ($('#payment_method').length) {
                            d.payment_method = $('#payment_method').val();
                        }

                        d = __datatable_ajax_callback(d);
                    }
                },
                scrollY: "75vh",
                scrollX: true,
                scrollCollapse: true,
                columns: [
                    // {
                    //     data: 'action',
                    //     name: 'action',
                    //     orderable: false,
                    //     "searchable": false
                    // },
                    {
                        data: 'sales_first_name',
                        name: 'sales_first_name',
                        "searchable": false
                    },
                    {
                        data: 'visit_date',
                        name: 'visit_date',
                        "searchable": false
                    },
                    {
                        data: 'customer_first_name',
                        name: 'customer_first_name'
                    },
                    {
                        data: 'customer_address',
                        name: 'customer_address',
                        "searchable": false
                    },
                    {
                        data: 'customer_mobile',
                        name: 'customer_mobile',
                        "searchable": false
                    },
                    {
                        data: 'status',
                        name: 'status',
                        "searchable": false
                    },
                ],
                "fnDrawCallback": function(oSettings) {
                    __currency_convert_recursively($('#sell_table'));
                },
                "footerCallback": function(row, data, start, end, display) {
                    var footer_sale_total = 0;
                    var footer_total_paid = 0;
                    var footer_total_remaining = 0;
                    var footer_total_sell_return_due = 0;
                    var footer_total_transfer = 0;
                    var footer_total_cash = 0;
                    for (var r in data) {
                        footer_sale_total += $(data[r].final_total).data('orig-value') ? parseFloat($(
                            data[r].final_total).data('orig-value')) : 0;
                        footer_total_paid += $(data[r].total_paid).data('orig-value') ? parseFloat($(
                            data[r].total_paid).data('orig-value')) : 0;
                         var element = $(data[r]['payment_methods']);
                        // alert((element.data('orig-value') == 'Transfer Bank'));
                        const origValue = (element.attr('data-orig-value') || '').trim().toLowerCase();
                        console.log(origValue);
                        console.log(origValue === 'transfer bank');
                        if (origValue === 'transfer bank') {
                            const value = parseFloat($(data[r].total_paid).attr('data-orig-value')) || 0;
                            footer_total_transfer += value;
                        } else {
                            const value = parseFloat($(data[r].total_paid).attr('data-orig-value')) || 0;
                            footer_total_cash += value;
                        }
                        footer_total_remaining += $(data[r].total_remaining).data('orig-value') ?
                            parseFloat($(data[r].total_remaining).data('orig-value')) : 0;
                        footer_total_sell_return_due += $(data[r].return_due).find('.sell_return_due')
                            .data('orig-value') ? parseFloat($(data[r].return_due).find(
                                '.sell_return_due').data('orig-value')) : 0;
                    }

                    $('.footer_total_sell_return_due').html(__currency_trans_from_en(
                        footer_total_sell_return_due));
                    $('.footer_total_remaining').html('Total Belum Dibayar :<br>' +__currency_trans_from_en(footer_total_remaining));
                    $('.footer_total_paid').html('Total Dibayar :<br>' +__currency_trans_from_en(footer_total_paid));
                    $('.footer_sale_total').html('Total Penjualan :<br>' +__currency_trans_from_en(footer_sale_total));
                    $('.footer_total_cash').html('Total Bayar Cash :<br>' + __currency_trans_from_en(footer_total_cash));
                    $('.footer_total_transfer').html('Total Bayar Transfer :<br>' +__currency_trans_from_en(footer_total_transfer));


                    $('.footer_payment_status_count').html(__count_status(data, 'payment_status'));
                    $('.service_type_count').html(__count_status(data, 'types_of_service_name'));
                    $('.payment_method_count').html(__count_status(data, 'payment_methods'));
                },
                createdRow: function(row, data, dataIndex) {
                    $(row).find('td:eq(6)').attr('class', 'clickable_td');
                }
            });

            $(document).on('change',
                '#sell_list_filter_location_id, #sell_list_filter_customer_id, #sell_list_filter_payment_status, #created_by, #sales_cmsn_agnt, #service_staffs, #shipping_status, #sell_list_filter_source, #payment_method',
                function() {
                    sell_table.ajax.reload();
                });

            $('#only_subscriptions').on('ifChanged', function(event) {
                sell_table.ajax.reload();
            });
        });
    </script>
    <script src="{{ asset('js/payment.js?v=' . $asset_v) }}"></script>
@endsection
