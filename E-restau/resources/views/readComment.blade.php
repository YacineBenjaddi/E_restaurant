
@include('inc.header')


	 <table class="table m-0">
                    <thead>
                    <tr>
                     <th>ID</th>	
                      <th>TITLE</th>
                      <th>TEXTO</th>
                      <th>NAME</th>
                      <th>RATING</th>
                       <th>ID RESTAURANT</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    
                         <td>{{ $comments->id }}</td>
                         <td>{{ $comments->title }}</td>
                        <td>{{ $comments->texto }}</td>
                        <td>{{ $comments->name }}</td>
                        <td>{{ $comments->rating }}</td>
                          <td>{{ $comments->id_restaurant }}</td>
                    </tr>
                    
                    </tbody>
                  </table>
@include('inc.footer')
