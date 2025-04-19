<?php

namespace App\Filament\Resources\InstructorBatchResource\Pages;

use App\Filament\Resources\InstructorBatchResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditInstructorBatch extends EditRecord
{
    protected static string $resource = InstructorBatchResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
