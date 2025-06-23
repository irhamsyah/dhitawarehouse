<div class="modal-dialog" role="document">
	{!! Form::open(['url' => action([\App\Http\Controllers\SalesAdminController::class, 'updateSalesmanTarget'], [$salesman_target->id]), 'method' => 'put', 'id' => 'edit_sales_target_form' ]) !!}
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">@lang('Edit Target Penjualan') - {{ $salesman_target->sales_name ?? '-' }} </h4>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						{!! Form::label('sales_target', __('lang_v1.sales_target') . ':') !!}
						@php
							$sales_target = isset($salesman_target->sales_target) ? number_format($salesman_target->sales_target, 0) : 0;
						@endphp
						{!! Form::text('sales_target', $sales_target, ['class' => 'form-control input_number', 'placeholder' => __('lang_v1.sales_target')]) !!}
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						{!! Form::label('remaining_target', __('sales_admin.remaining_target') . ':') !!}
						@php
							$remaining_target = isset($salesman_target->remaining_target) ? number_format($salesman_target->remaining_target) : 0;
						@endphp
						{!! Form::text('remaining_target', $remaining_target, ['class' => 'form-control input_number', 'placeholder' => __('sales_admin.remaining_target')]) !!}
					</div>
				</div>
			</div>

			
		</div>
		<div class="modal-footer">
			<button type="submit" class="tw-dw-btn tw-dw-btn-primary tw-text-white">@lang('messages.update')</button>
		    <button type="button" class="tw-dw-btn tw-dw-btn-neutral tw-text-white" data-dismiss="modal">@lang('messages.cancel')</button>
		</div>
		{!! Form::close() !!}
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->