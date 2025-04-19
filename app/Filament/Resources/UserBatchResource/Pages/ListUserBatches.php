<?php

namespace App\Filament\Resources\UserBatchResource\Pages;

use App\Filament\Resources\UserBatchResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListUserBatches extends ListRecords
{
    protected static string $resource = UserBatchResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
