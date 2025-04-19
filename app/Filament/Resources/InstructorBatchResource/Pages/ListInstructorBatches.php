<?php

namespace App\Filament\Resources\InstructorBatchResource\Pages;

use App\Filament\Resources\InstructorBatchResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListInstructorBatches extends ListRecords
{
    protected static string $resource = InstructorBatchResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
