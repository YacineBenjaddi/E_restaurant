
@include('inc.header')


	 <table class="table m-0">
                    <thead>
                    <tr>
                      <th>ID</th>                
                      <th>Nom</th>
                      <th>Prenom</th>
                      <th>Email</th>
                      <th>Password</th>
                      <th>Profil</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      
                      <td>{{ $admins->id_user}}</td>
                      <td>{{ $admins->last_name }}</td>
                      <td>{{ $admins->first_name }}</span></td>
                      <td>
                        <div class="sparkbar" data-color="#00a65a" data-height="20">{{ $admins->email }}</div>
                      </td>
                        <td>{{ $admins->password }}</td>
                        <td>{{ $admins->profile }}</td>
                 
                    </tr>
                    
                    </tbody>
                  </table>
@include('inc.footer')
