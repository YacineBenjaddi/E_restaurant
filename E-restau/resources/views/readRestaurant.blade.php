
@include('inc.header')


	 <table class="table m-0">
                    <thead>
                    <tr>
                     <th>ID</th>	
                      <th>Name</th>
                      <th>Image Path</th>
                      <th>Category</th>
                      <th>discount</th>
                      <th>ratings</th>
                       <th>information</th>
                      <th>latitude</th>
                       <th>longitude</th>
                      
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    
                       <td>{{ $restaurants->id_restaurant }}</td>
                      <td>{{ $restaurants->name }}</td>
                  
                      <td> <img src="{{ asset($restaurants->imagepath) }}" width= "100px" height="100px" alt="Image"></td>
                      <td>
                        <div class="sparkbar" data-color="#00a65a" data-height="20">{{ $restaurants->category }}</div>
                      </td>
                        <td>{{ $restaurants->discount }}</td>
                        <td>{{ $restaurants->ratings }}</td>
                        <td>{{ $restaurants->info }}</td>
                        <td>{{ $restaurants->latitude }}</td>
                        <td>{{ $restaurants->longitude }}</td>
                    </tr>
                    
                    </tbody>
                  </table>
@include('inc.footer')
