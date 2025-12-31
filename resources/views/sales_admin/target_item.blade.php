@extends('layouts.app')
@section('title', __('lang_v1.sales_target_item'))

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header no-print">
        <h1  class="tw-text-xl md:tw-text-3xl tw-font-bold tw-text-black">@lang('lang_v1.sales_target_item')
        </h1>
    </section>

    <!-- Main content -->
     <section class="content-header no-print">
     @if(count($business_locations) > 0)
    <div class="row">
        <div class="col-sm-3">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-user"></i>
                    </span>
                {!! Form::select('select_salesman_id', $salesman, $default_salesman->id ?? null, ['class' => 'form-control input-sm',
                'id' => 'select_salesman_id', 
                'required', 'autofocus'], ); !!}
                <span class="input-group-addon">
                        @show_tooltip(__('tooltip.sales_name'))
                    </span> 
                </div>
            </div>
        </div>
    </div>
    @endif
    @if(count($business_locations) > 0)
    <div class="row">
        <div class="col-sm-3">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-map-marker"></i>
                    </span>
                {!! Form::select('select_location_id', $_business_locations, $default_location->id ?? null, ['class' => 'form-control input-sm',
                'id' => 'select_location_id', 
                'required', 'autofocus'], ); !!}
                <span class="input-group-addon">
                        @show_tooltip(__('tooltip.sale_location'))
                    </span> 
                </div>
            </div>
        </div>
    </div>
    @endif
    </section>
    <section class="content no-print">
        @component('components.widget', ['class' => 'box-primary', ])
            
            @if (auth()->user()->can('direct_sell.view') ||
                    auth()->user()->can('view_own_sell_only') ||
                    auth()->user()->can('view_commission_agent_sell'))
                @php
                    $custom_labels = json_decode(session('business.custom_labels'), true);
                @endphp
                <table class="table table-bordered table-striped ajax_view" id="sell_table">
                    <thead>
                        <tr>                            
                            <th class="tw-w-64">@lang('Tindakan')</th>
                            <th class="tw-w-64">@lang('Nama Sales')</th>
                            <th class="tw-w-64">@lang('Nama Produk')</th>
                            <th class="tw-w-64">@lang('Total Penjualan')</th>
                            <th class="tw-w-64">@lang('Target Penjualan')</th>
                            <th class="tw-w-64">@lang('sales_admin.remaining_target')</th>                          
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
                    "url": "/sales-admin/target-item",
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

                        d.added_by = $('#added_by').val();

                        
                        d.sales_id = $('#select_salesman_id').val();
                        d.location_id = $('#select_location_id').val();

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
                    {
                        data: 'action',
                        name: 'action',
                        "searchable": false
                    },
                    {
                        data: 'sales_name',
                        name: 'sales_name',
                        "searchable": false
                    },
                    {
                        data: 'product_name',
                        name: 'product_name',
                        "searchable": false
                    },
                    {
                        data: 'total_sale',
                        name: 'total_sale',
                        "searchable": false
                    },
                    {
                        data: 'sales_target',
                        name: 'sales_target',
                        "searchable": false
                    },
                    {
                        data: 'remaining_target',
                        name: 'remaining_target',
                        "searchable": false
                    },
                    // {
                    //     data: 'last_name',
                    //     name: 'u.last_name',
                    //     visible: false
                    // },
                    
                ],
                "fnDrawCallback": function(oSettings) {
                    __currency_convert_recursively($('#sell_table'));
                },
                "footerCallback": function(row, data, start, end, display) {
                    // var total_sale = 10;
                    // var footer_sale_total = 0;
                    // var footer_total_paid = 0;
                    // var footer_total_remaining = 0;
                    // var footer_total_sell_return_due = 0;
                    // for (var r in data) {
                    //     footer_sale_total += $(data[r].final_total).data('orig-value') ? parseFloat($(
                    //         data[r].final_total).data('orig-value')) : 0;
                    //     footer_total_paid += $(data[r].total_paid).data('orig-value') ? parseFloat($(
                    //         data[r].total_paid).data('orig-value')) : 0;
                    //     footer_total_remaining += $(data[r].total_remaining).data('orig-value') ?
                    //         parseFloat($(data[r].total_remaining).data('orig-value')) : 0;
                    //     footer_total_sell_return_due += $(data[r].return_due).find('.sell_return_due')
                    //         .data('orig-value') ? parseFloat($(data[r].return_due).find(
                    //             '.sell_return_due').data('orig-value')) : 0;
                    // }

                    // $('.footer_total_sell_return_due').html(__currency_trans_from_en(
                    //     footer_total_sell_return_due));
                    // $('.footer_total_remaining').html(__currency_trans_from_en(footer_total_remaining));
                    // $('.footer_total_paid').html(__currency_trans_from_en(footer_total_paid));
                    // $('.footer_sale_total').html(__currency_trans_from_en(footer_sale_total));

                    // $('.footer_payment_status_count').html(__count_status(data, 'payment_status'));
                    // $('.service_type_count').html(__count_status(data, 'types_of_service_name'));
                    // $('.payment_method_count').html(__count_status(data, 'payment_methods'));
                },
                createdRow: function(row, data, dataIndex) {
                    $(row).find('td:eq(6)').attr('class', 'clickable_td');
                }
            });

            $(document).on('change',
                '#added_by',
                function() {
                    sell_table.ajax.reload();
                });
            $(document).on('change',
                '#select_salesman_id',
                function() {
                    sell_table.ajax.reload();
                });
            $(document).on('change',
                '#select_location_id',
                function() {
                    sell_table.ajax.reload();
                });

            $('#only_subscriptions').on('ifChanged', function(event) {
                sell_table.ajax.reload();
            });
        });

        $('#select_salesman_id').on('change', function() {
				var selectedSalesman = $(this).val();
				var $locationSelect = $('#select_location_id');
				$('#selected_salesman').val(selectedSalesman);
				
				// Clear existing options
				$locationSelect.empty();
				$locationSelect.append('<option value="">Loading...</option>'); // Placeholder while loading
				
				// Fetch categories based on the selected tipe
				$.ajax({
					url: '/business-location/forsalesman?q=' + encodeURIComponent(selectedSalesman),
					type: 'GET',
					success: function(data) {
						data = JSON.parse(data); 
						const result = Object.entries(data).map(([key, value]) => ({ id: key, name: value }));
						// alert(result[0].name);
						$locationSelect.empty(); // Clear placeholder
						if (result.length > 0) {
							// Append new options
							result.forEach(function(location) {
								$locationSelect.append(
									`<option value="${location.id}">${location.name}</option>`
								);
							});
							$('#location_id').val(result[0].id);
                            $locationSelect.val(result[0].id);
                            sell_table.ajax.reload();
						} else {
							$locationSelect.append(
								'<option value="">No location available</option>'
							);
						}
                        // alert(selectedSalesman);
                        // alert($('#select_location_id').val());
					},
					error: function() {
						$locationSelect.empty();
						$locationSelect.append(
							'<option value="">Failed to load location</option>'
						);
					}
				});
                
			});
			
			function setLocation() {
				var selectedSalesman = $('#select_salesman_id').val();
				var $locationSelect = $('#select_location_id');
				$('#selected_salesman').val(selectedSalesman);
				
				// Clear existing options
				$locationSelect.empty();
				$locationSelect.append('<option value="">Loading...</option>'); // Placeholder while loading
				
				// Fetch categories based on the selected tipe
				$.ajax({
					url: '/business-location/forsalesman?q=' + encodeURIComponent(selectedSalesman),
					type: 'GET',
					success: function(data) {
						data = JSON.parse(data); 
						const result = Object.entries(data).map(([key, value]) => ({ id: key, name: value }));
						// alert(result[0].name);
						$locationSelect.empty(); // Clear placeholder
						if (result.length > 0) {
							// Append new options
							result.forEach(function(location) {
								$locationSelect.append(
									`<option value="${location.id}">${location.name}</option>`
								);
							});
							$('#location_id').val(result[0].id);
                            $locationSelect.val(result[0].id);
                            sell_table.ajax.reload();
						} else {
							$locationSelect.append(
								'<option value="">No location available</option>'
							);
						}
					},
					error: function() {
						$locationSelect.empty();
						$locationSelect.append(
							'<option value="">Failed to load location</option>'
						);
					}
				});
                
			};

			setLocation();
            
    </script>
    <script src="{{ asset('js/payment.js?v=' . $asset_v) }}"></script>
@endsection
