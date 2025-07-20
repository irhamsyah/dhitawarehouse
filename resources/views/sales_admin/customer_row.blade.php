<tr class="customer_row" data-row_index="{{$row_count}}">
	<td class="serial_no" ></td>
	<!-- <td>{{ $contact->contact_id }}</td> -->
	<input type="hidden" 
	name="customers[{{$row_count}}][contact_id]" 
	value="{{$contact->id}}">
    <td>{{ $contact->name }}</td>
    <td>{{ $contact->address_line_1}}</td>
    <td>{{ $contact->mobile }}</td>
	<td class="text-center v-center">
		<i class="fa fa-times text-danger pos_remove_row cursor-pointer" aria-hidden="true"></i>
	</td>
</tr>