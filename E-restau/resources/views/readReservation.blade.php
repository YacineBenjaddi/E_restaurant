
@include('inc.header')


	 <table class="table m-0">
                    <thead>
                    <tr>
                     <th>ID</th>	
                      <th>ID USER</th>
                      <th>ID RESTAURANT</th>
                      <th>HOUR</th>
                      <th>DATE</th>
                      
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    
                         <td>{{ $reservations->id_Reservation }}</td>
                         <td>{{ $reservations->id_user }}</td>
                        <td>{{ $reservations->id_restaurant }}</td>
                        <td>{{ $reservations->hour }}</td>
                        <td>{{ $reservations->date_res }}</td>

                    </tr>
                    
                    </tbody>
                  </table>
@include('inc.footer')
