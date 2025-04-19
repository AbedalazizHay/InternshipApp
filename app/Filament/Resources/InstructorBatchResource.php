<?php

namespace App\Filament\Resources;

use App\Filament\Resources\InstructorBatchResource\Pages;
use App\Filament\Resources\InstructorBatchResource\RelationManagers;
use App\Models\Instructor_Batch;
use App\Models\InstructorBatch;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class InstructorBatchResource extends Resource
{
    protected static ?string $model = Instructor_Batch::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('user_id')
                    ->label('Instructor')
                    ->relationship('user', 'email', fn ($query) => $query->where('role', 'instructor'))
                    ->searchable()
                    ->preload()
                    ->required(),

                Select::make('batch_id')
                    ->relationship('batch', 'name')
                    ->preload()
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.first_name')
                    ->label('Instructor First Name')
                    ->searchable(),

                TextColumn::make('user.last_name')
                    ->label('Last Name')
                    ->searchable(),

                TextColumn::make('user.email')
                    ->label('Email')
                    ->searchable(),

                TextColumn::make('batch.name')
                    ->label('Batch')
                    ->searchable()
                    ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListInstructorBatches::route('/'),
            'create' => Pages\CreateInstructorBatch::route('/create'),
            'edit' => Pages\EditInstructorBatch::route('/{record}/edit'),
        ];
    }
}
