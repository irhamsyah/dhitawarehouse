<style>
  .custom-modal {
  max-width: 70% !important;
  width: 70% !important;
}
</style>
<div class="modal-dialog custom-modal" role="document">
  <div class="modal-content">

    {!! Form::open(['url' => action([\App\Http\Controllers\TransactionPaymentController::class, 'store']), 'method' => 'post', 'id' => 'transaction_payment_add_form', 'files' => true ]) !!}
    {!! Form::hidden('transaction_id', $transaction->id); !!}
    @if(!empty($transaction->location))
      {!! Form::hidden('default_payment_accounts', $transaction->location->default_payment_accounts, ['id' => 'default_payment_accounts']); !!}
    @endif
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h4 class="modal-title">@lang( 'purchase.add_payment' )</h4>
    </div>

    <div class="modal-body">
      <div class="row">
      @if(!empty($transaction->contact))
        <div class="col-md-4">
          <div class="well">
            <strong>
            @if(in_array($transaction->type, ['purchase', 'purchase_return']))
              @lang('purchase.supplier') 
            @elseif(in_array($transaction->type, ['sell', 'sell_return']))
              @lang('contact.customer') 
            @endif
            </strong>:{{ $transaction->contact->full_name_with_business }}<br>
            <strong>@lang('business.business'): </strong>{{ $transaction->contact->supplier_business_name }}
          </div>
        </div>
        @endif
        <div class="col-md-4">
          <div class="well">
          @if(in_array($transaction->type, ['sell', 'sell_return']))
            <strong>@lang('sale.invoice_no'): </strong>{{ $transaction->invoice_no }}
          @else
            <strong>@lang('purchase.ref_no'): </strong>{{ $transaction->ref_no }}
          @endif
          @if(!empty($transaction->location))
            <br>
            <strong>@lang('purchase.location'): </strong>{{ $transaction->location->name }}
          @endif
          </div>
        </div>
        <div class="col-md-4">
          <div class="well">
            <strong>@lang('sale.total_amount'): </strong><span class="display_currency" data-currency_symbol="true">{{ $transaction->final_total }}</span><br>
            <strong>@lang('purchase.payment_note'): </strong>
            @if(!empty($transaction->additional_notes))
            {{ $transaction->additional_notes }}
            @else
              --
            @endif
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          @if(!empty($transaction->contact))
            <strong>@lang('lang_v1.advance_balance'):</strong> <span class="display_currency" data-currency_symbol="true">{{$transaction->contact->balance}}</span>

            {!! Form::hidden('advance_balance', $transaction->contact->balance, ['id' => 'advance_balance', 'data-error-msg' => __('lang_v1.required_advance_balance_not_available')]); !!}
          @endif
        </div>
      </div>
      <div class="row payment_row">
        <div class="col-md-4">
          <div class="form-group">
            {!! Form::label("method" , __('purchase.payment_method') . ':*') !!}
            <div class="input-group">
              <span class="input-group-addon">
                <i class="fas fa-money-bill-alt"></i>
              </span>
              {!! Form::select("method", $payment_types, $payment_line->method, ['class' => 'form-control select2 payment_types_dropdown', 'required', 'style' => 'width:100%;']); !!}
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="form-group">
            {!! Form::label("paid_on" , __('lang_v1.paid_on') . ':*') !!}
            <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-calendar"></i>
              </span>
              {!! Form::text('paid_on', @format_datetime($payment_line->paid_on), ['class' => 'form-control', 'readonly', 'required']); !!}
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="form-group">
            {!! Form::label("amount" , __('sale.amount') . ':*') !!}
            <div class="input-group">
              <span class="input-group-addon">
                <i class="fas fa-money-bill-alt"></i>
              </span>
              {!! Form::text("amount", @num_format($payment_line->amount), ['class' => 'form-control input_number payment_amount', 'required', 'placeholder' => 'Amount', 'data-rule-max-value' => $payment_line->amount, 'data-msg-max-value' => __('lang_v1.max_amount_to_be_paid_is', ['amount' => $amount_formated])]); !!}
            </div>
          </div>
        </div>

        @php
            $pos_settings = !empty(session()->get('business.pos_settings')) ? json_decode(session()->get('business.pos_settings'), true) : [];
            $enable_cash_denomination_for_payment_methods = !empty($pos_settings['enable_cash_denomination_for_payment_methods']) ? $pos_settings['enable_cash_denomination_for_payment_methods'] : [];
        @endphp

        @if(!empty($pos_settings['enable_cash_denomination_on']) && $pos_settings['enable_cash_denomination_on'] == 'all_screens')
            <input type="hidden" class="enable_cash_denomination_for_payment_methods" value="{{json_encode($pos_settings['enable_cash_denomination_for_payment_methods'])}}">
            <div class="clearfix"></div>
            <div class="col-md-12 cash_denomination_div @if(!in_array($payment_line->method, $enable_cash_denomination_for_payment_methods)) hide @endif">
                <hr>
                <strong>@lang( 'lang_v1.cash_denominations' )</strong>
                  @if(!empty($pos_settings['cash_denominations']))
                    <table class="table table-slim">
                      <thead>
                        <tr>
                          <th width="20%" class="text-right">@lang('lang_v1.denomination')</th>
                          <th width="20%">&nbsp;</th>
                          <th width="20%" class="text-center">@lang('lang_v1.count')</th>
                          <th width="20%">&nbsp;</th>
                          <th width="20%" class="text-left">@lang('sale.subtotal')</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach(explode(',', $pos_settings['cash_denominations']) as $dnm)
                        <tr>
                          <td class="text-right">{{$dnm}}</td>
                          <td class="text-center" >X</td>
                          <td>{!! Form::number("denominations[$dnm]", null, ['class' => 'form-control cash_denomination input-sm', 'min' => 0, 'data-denomination' => $dnm, 'style' => 'width: 100px; margin:auto;' ]); !!}</td>
                          <td class="text-center">=</td>
                          <td class="text-left">
                            <span class="denomination_subtotal">0</span>
                          </td>
                        </tr>
                        @endforeach
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="4" class="text-center">@lang('sale.total')</th>
                          <td>
                            <span class="denomination_total">0</span>
                            <input type="hidden" class="denomination_total_amount" value="0">
                            <input type="hidden" class="is_strict" value="{{$pos_settings['cash_denomination_strict_check'] ?? ''}}">
                          </td>
                        </tr>
                      </tfoot>
                    </table>
                    <p class="cash_denomination_error error hide">@lang('lang_v1.cash_denomination_error')</p>
                  @else
                    <p class="help-block">@lang('lang_v1.denomination_add_help_text')</p>
                  @endif
            </div>
            <div class="clearfix"></div>
        @endif
        @if(!empty($accounts))
          <div class="col-md-6">
            <div class="form-group">
              {!! Form::label("account_id" , __('lang_v1.payment_account') . ':') !!}
              <div class="input-group">
                <span class="input-group-addon">
                  <i class="fas fa-money-bill-alt"></i>
                </span>
                {!! Form::select("account_id", $accounts, !empty($payment_line->account_id) ? $payment_line->account_id : '' , ['class' => 'form-control select2', 'id' => "account_id", 'style' => 'width:100%;']); !!}
              </div>
            </div>
          </div>
        @endif
        
        <!-- Uang Muka yg belum dibayar -->
        @if(!empty($sell_due) && count($sell_due) > 0)
          <div class="col-md-12">
            <h4>@lang('Transaksi belum dibayar :')</h4>
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>
                    <input type="checkbox" id="check_all_sell_due">
                  </th>
                  <th>@lang('No. Voucher')</th>
                  <th>@lang('Deskripsi')</th>
                  <th>@lang('sale.total_amount')</th>                  
                  <th>@lang('Sisa')</th>
                </tr>
              </thead>
              <tbody>
                @php
                  $sum_all = $sell_due->sum('total_invoice');
                  $sum_first5 = $sell_due->take(5)->sum('total_invoice');
                  $sum_difference = $sum_all - $sum_first5;
                @endphp

                @foreach($sell_due->take(5) as $row)
                  <tr>
                    <td>
                      <input type="checkbox" name="sell_due_selected[]" value="{{ $row->id }}" class="sell_due_checkbox">
                    </td>
                    <td>{{ $row->invoice_no }}</td>
                     <td>
                      <span >
                        {{ $row->products }}
                      </span>
                    </td>
                    <td>
                      <span class="display_currency" data-currency_symbol="true">
                        {{ $row->total_invoice }}
                      </span>
                    </td>                   
                    <td>
                      <span class="display_currency" data-due-currency_symbol="true">
                        {{ $row->sell_due }}
                      </span>
                    </td>
                  </tr>
                @endforeach

                {{-- Show totals --}}
                <tr>
                  <td>
                    <input type="hidden" name="include_remaining" value="0">
                    <!-- Checkbox to enable/disable editing -->
                    <input type="checkbox" id="include_remaining" name="include_remaining" value="1" class="form-check-input">
                  </td>
                  <td>
                  </td>
                  <td>
                    <!-- Hidden field ensures always something sent -->                      
                    <label for="remaining_amount">Sisa uang muka belum dibayar:</label>
                  </td>
                  <td>
                  </td>
                  <td>
                    <div class="form-group mb-0">
                      

                      <!-- Editable input -->
                      <input type="text" 
                            class="form-control input_number" 
                            id="remaining_amount" 
                            name="remaining_amount" 
                            value="{{ $sum_difference }}" 
                            data-rule-min="0" 
                            data-msg-min="@lang('validation.min.numeric', ['min' => 0])"
                            >
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2"></td>
                  <td>
                    <!-- Hidden field ensures always something sent -->                      
                    <label for="remaining_amount">Total uang muka belum dibayar:</label>
                  </td>
                  <td>
                  </td>
                  <td>
                    <span class="display_currency" data-currency_symbol="true">{{ $sum_all }}</span>
                  </td>
                </tr>
              </tbody>
            </table>            
          </div>
        @endif

        @if(in_array($transaction->type, ['purchase', 'purchase_return']))
          <table class="table table-bordered hidden">
          <thead>
            <tr>
              <th>SKU</th>
              <th>Product Name</th>
              <th>Quantity</th>
              <th>Premi Total</th>
            </tr>
          </thead>
          <tbody>
            @php
              $sum_qty = $transaction_detail->sum('quantity');
            @endphp
            @foreach($transaction_detail as $row)
              <tr>
                <td>{{ $row->sku }}</td>
                <td>{{ $row->name }}</td>
                <td>{{ $row->quantity }}</td>
                <td>
                  <span class="display_currency" data-currency_symbol="true">
                    {{ $row->quantity * 20000 }}
                  </span>
                </td>
              </tr>
            @endforeach
          </tbody>          
        </table>
          <!-- Premi input with checkbox -->
          <div class="col-md-12">
            <!-- <div class="col-md-4"> -->
              <div class="form-group">
                <table class="table table-bordered">
          
                <tbody>            
                    <tr>
                      <td >
                          <!-- Hidden field ensures always something sent -->
                          <input type="hidden" name="include_premi" value="0">

                          <!-- Checkbox overrides hidden value when checked -->
                          <input type="checkbox" id="include_premi" name="include_premi" value="1" class="form-check-input">                                                                        
                      </td>
                      <td>
                         <label for="premi_amount" class="ms-2 me-3">@lang('Premi')</label> 
                      </td>
                      <td colspan="2">
                        <span class="me-3">Total Quantity: {{ $sum_qty }} Kg</span>
                      </td>
                      <td >
                        <input type="hidden" 
                              class="form-control input_number d-inline-block" 
                              style="width:150px" 
                              id="premi" 
                              name="premi" 
                              value="{{ 20000 }}" 
                              data-rule-min="0" 
                              data-msg-min="@lang('validation.min.numeric', ['min' => 0])"
                          >
                          <span class="display_currency" data-currency_symbol="false">{{ 20000 }}</span>
                      </td>
                      <td >
                        <!-- hidden input for total premi -->
                        <input type="hidden" id="premi_amount" name="premi_amount" value="{{ 20000 * $sum_qty }}">
                        <span class="me-3" >
                          Total Premi: 
                        </span>
                        <span class="display_currency" id="total_premi">{{ 20000 * $sum_qty }}</span>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <!-- Hidden field ensures always something sent -->
                          <input type="hidden" name="include_titipan" value="0">

                          <!-- Checkbox overrides hidden value when checked -->
                          <input type="checkbox" id="include_titipan" name="include_titipan" value="1" class="form-check-input">
                      </td>
                      <td>
                          <label for="titipan_amount" class="ms-2 me-3">@lang('Titipan')</label>                                                
                      </td>
                      <td colspan="2"></td>
                      <td>
                        <input type="text" 
                              class="form-control input_number d-inline-block display_currency" 
                              style="width:150px" 
                              id="titipan" 
                              name="titipan" 
                              value="{{ 20000 }}" 
                              data-rule-min="0" 
                              data-msg-min="@lang('validation.min.numeric', ['min' => 0])"
                          >
                      </td>
                      <td>
                        <!-- hidden input for total premi -->
                        <input type="hidden" id="titipan_amount" name="titipan_amount" value="{{ 20000 * $sum_qty }}">
                        <span class="me-3" >
                          Total Titipan: 
                        </span>
                        <span class="display_currency" id="total_titipan">{{ 20000 * $sum_qty }}</span>
                      </td>
                  </tr>

                </tbody>      
                </table>
              </div>
            <!-- </div> -->
          </div>

          <!-- Titipan Premi input with checkbox -->
          <div class="col-md-12">
              <table class="table table-bordered">          
                <tbody>            
                    

                </tbody>      
                </table>
            </div>  
        @endif

        <div class="col-md-4">
          <div class="form-group">
            {!! Form::label('document', __('purchase.attach_document') . ':') !!}
            {!! Form::file('document', ['accept' => implode(',', array_keys(config('constants.document_upload_mimes_types')))]); !!}
            <p class="help-block">
            @includeIf('components.document_help_text')</p>
          </div>
        </div>
        <div class="clearfix"></div>
          @include('transaction_payment.payment_type_details')
        <div class="col-md-12">
          <div class="form-group">
            {!! Form::label("note", __('lang_v1.payment_note') . ':') !!}
            {!! Form::textarea("note", $payment_line->note, ['class' => 'form-control', 'rows' => 3]); !!}
          </div>
        </div>
      </div>
    </div>

    <div class="modal-footer">
      <button type="submit" class="tw-dw-btn tw-dw-btn-primary tw-text-white">@lang( 'messages.save' )</button>
      <button type="button" class="tw-dw-btn tw-dw-btn-neutral tw-text-white" data-dismiss="modal">@lang( 'messages.close' )</button>
    </div>

    {!! Form::close() !!}

  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

<script>  
(function() {
  function updatePaymentAmount() {
    let baseAmount = parseFloat("{{ $payment_line->amount }}"); // original amount from controller
    let totalChecked = 0;

    // Sum selected due
    document.querySelectorAll('.sell_due_checkbox:checked').forEach(cb => {
      let row = cb.closest('tr');
      let due = parseFloat(
        row.querySelector('span[data-due-currency_symbol]').textContent.replace(/[^0-9.-]+/g,"")
      ) || 0;
      totalChecked += due;
    });

    // Subtract selected due from base
    let newAmount = baseAmount - totalChecked;

    // Add premi if checked
    let premiCheckbox = document.getElementById('include_premi');
    let premiAmount = document.getElementById('premi_amount');
    if (premiCheckbox && premiCheckbox.checked) {
      let premiVal = parseFloat(premiAmount.value.replace(/[^0-9.-]+/g,"")) || 0;
      newAmount -= premiVal;
    }

    // Add titipan if checked
    let titipanCheckbox = document.getElementById('include_titipan');
    let titipanAmount = document.getElementById('titipan_amount');
    if (titipanCheckbox && titipanCheckbox.checked) {
      let titipanVal = parseFloat(titipanAmount.value.replace(/[^0-9.-]+/g,"")) || 0;
      newAmount -= titipanVal;
    }

    // Add remaining (sum_difference) if checked
    let remainingCheckbox = document.getElementById('include_remaining');
    let remainingInput = document.getElementById('remaining_amount');
    if (remainingCheckbox && remainingCheckbox.checked) {
      let remainingVal = parseFloat(remainingInput.value.replace(/[^0-9.-]+/g,"")) || 0;
      newAmount -= remainingVal;
    }

    if (newAmount < 0) newAmount = 0;

    // Update payment input
    let amountInput = document.querySelector('.payment_amount');
    amountInput.value = newAmount.toFixed(2);
  }

  // Select All toggle
  document.getElementById('check_all_sell_due')?.addEventListener('change', function(e) {
    document.querySelectorAll('.sell_due_checkbox').forEach(cb => {
      cb.checked = e.target.checked;
    });
    updatePaymentAmount();
  });

  // Each checkbox update
  document.querySelectorAll('.sell_due_checkbox').forEach(cb => {
    cb.addEventListener('change', updatePaymentAmount);
  });

  // Premi checkbox + input update
  document.getElementById('include_premi')?.addEventListener('change', updatePaymentAmount);
  document.getElementById('premi_amount')?.addEventListener('input', updatePaymentAmount);

  // Titipan checkbox + input update
  document.getElementById('include_titipan')?.addEventListener('change', updatePaymentAmount);
  document.getElementById('titipan_amount')?.addEventListener('input', updatePaymentAmount);

  // Remaining checkbox + input update
  document.getElementById('include_remaining')?.addEventListener('change', updatePaymentAmount);
  document.getElementById('remaining_amount')?.addEventListener('input', updatePaymentAmount);

  // Init on page load
  updatePaymentAmount();

  let premiInput = document.getElementById('premi');
  let totalPremiEl = document.getElementById('total_premi');
  let titipanInput = document.getElementById('titipan');
  let totalTitipanEl = document.getElementById('total_titipan');
  let sumQty = {{ $sum_qty }};

  function updatePremi() {
    let premiVal = parseFloat(premiInput.value.replace(/[^0-9.-]+/g,"")) || 0;
    let total = premiVal * sumQty;
    // Update hidden input
    document.getElementById('premi_amount').value = total;
    updatePaymentAmount();
    totalPremiEl.textContent = total.toLocaleString();
  }

  function updateTitipan() {
    let titipanVal = parseFloat(titipanInput.value.replace(/[^0-9.-]+/g,"")) || 0;
    let total = titipanVal * sumQty;
    // Update hidden input
    document.getElementById('titipan_amount').value = total;
    updatePaymentAmount();
    totalTitipanEl.textContent = total.toLocaleString();
  }

  premiInput.addEventListener('input', updatePremi);
  titipanInput.addEventListener('input', updateTitipan);
  updatePremi();
  updateTitipan();
})();
  
</script>


