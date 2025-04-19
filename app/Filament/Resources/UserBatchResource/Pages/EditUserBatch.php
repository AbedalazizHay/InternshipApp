<?php

namespace App\Filament\Resources\UserBatchResource\Pages;

use App\Filament\Resources\UserBatchResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditUserBatch extends EditRecord
{
    protected static string $resource = UserBatchResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
