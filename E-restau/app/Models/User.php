<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $id_user
 * @property string $nom
 * @property string $prenom
 * @property string $email
 * @property string $password
 * @property string $profil
 * 
 * 
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'user';
	protected $primaryKey = 'id_user';
	//public $incrementing = false;
	public $timestamps = false;

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'last_name',
		'first_name',
		'email',
		'password',
		'profile',
		'reset'
	];

	// public function avis()
	// {
	// 	return $this->hasMany(Avi::class, 'id_user');
	// }

	// public function reservations()
	// {
	// 	return $this->hasMany(Reservation::class, 'id_user');
	// }
}
