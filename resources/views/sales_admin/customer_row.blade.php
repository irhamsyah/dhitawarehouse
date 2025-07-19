<!-- <tr class="product_row">
	<td class="text-center v-center">
		<h1>blablaabalalhl</h1>
	</td>
	<td class="text-center v-center">
		<i class="fa fa-times text-danger pos_remove_row cursor-pointer" aria-hidden="true"></i>
	</td>
</tr> -->

<tr>
	<td>{{ $contact->id }}</td>
    <td>{{ $contact->name }}</td>
    <td>{{ $contact->address_line_1}}</td>
    <td>{{ $contact->mobile }}</td>
	<td class="text-center v-center">
		<i class="fa fa-times text-danger pos_remove_row cursor-pointer" aria-hidden="true"></i>
	</td>
</tr>