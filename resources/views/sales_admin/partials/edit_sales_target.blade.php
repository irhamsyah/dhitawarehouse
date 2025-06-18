<div class="modal-dialog" role="document">
	{!! Form::open(['url' => action([\App\Http\Controllers\SalesAdminController::class, 'updateSalesTarget'], [$product_location->product_id, $product_location->location_id]), 'method' => 'put', 'id' => 'edit_sales_target_form' ]) !!}
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">@lang('Edit Target Penjualan') - {{ $product_location->product_name ?? '-' }} </h4>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="col-md-4">
				<div class="form-group">
					{!! Form::label('sales_target', __( 'lang_v1.sales_target' ) . ':') !!} 
					{!! Form::text('sales_target', !empty($product_location->sales_target) ? @number_format($product_location->sales_target, 0) : 0, ['class' => 'form-control input_number', 'placeholder' => __( 'lang_v1.sales_target' ) ]); !!}
				</div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
					{!! Form::label('remaining_target', __( 'sales_admin.remaining_target' ) . ':') !!} 
					{!! Form::text('remaining_target', !empty($product_location->remaining_target) ? @number_format($product_location->remaining_target) : 0, ['class' => 'form-control input_number', 'placeholder' => __( 'sales_admin.remaining_target' ) ]); !!}
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