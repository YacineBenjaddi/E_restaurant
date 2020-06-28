<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Reservation
 * 
 * @property int $id_Reservation
 * @property int $id_user
 * @property int $id_restaurant
 * @property string $hour
 * @property string $date_res
 * 
 * @property User $user
 * @property Restaurant $restaurant
 *
 * @package App\Models
 */
class Reservation extends Model
{
	protected $table = 'reservation';
	protected $primaryKey = 'id_Reservation';
	public $timestamps = false;
	public $incrementing = false;


	protected $casts = [
		'id_user' => 'int',
		'id_restaurant' => 'int'
	];

	
	protected $fillable = [
		'id_user',
		'id_restaurant',
		'hour',
		'date_res'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'id_user');
	}

	public function restaurant()
	{
		return $this->belongsTo(Restaurant::class, 'id_restaurant');
	}

}
