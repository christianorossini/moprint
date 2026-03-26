<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Table;
use Illuminate\Database\Eloquent\Model;

#[Table('tblContrato')]
#[Table(key: 'nuContrato', keyType: 'string', incrementing: false)]
class Contrato extends Model
{
    //
}
