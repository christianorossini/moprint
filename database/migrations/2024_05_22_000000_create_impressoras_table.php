<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('impressoras', function (Blueprint $table) {
            $table->id();
            $table->string('ip');
            $table->string('marca');
            $table->string('modelo');
            $table->string('numero_serie');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('impressoras');
    }
};