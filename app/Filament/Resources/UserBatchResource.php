<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserBatchResource\Pages;
use App\Filament\Resources\UserBatchResource\RelationManagers;
use App\Models\User_Batch;
use App\Models\UserBatch;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class UserBatchResource extends Resource
{
    protected static ?string $model = User_Batch::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('user_id')
                    ->relationship('user', 'email')
                    ->searchable()
                    ->required(),

                Select::make('batch_id')
                    ->relationship('batch', 'name')
                    ->preload()
                    ->required(),

                Forms\Components\BelongsToManyMultiSelect::make('track_id')
                    ->relationship('track', 'name')
                    ->preload()
                    ->required(),

                Select::make('payment_id')
                    ->relationship('payment', 'payment_reference')
                    ->searchable()
                    ->preload()
                    ->label('Payment Ref'),

                Select::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'registered' => 'Registered',
                        'cancelled' => 'Cancelled',
                    ])
                    ->required(),

                DatePicker::make('registration_date')
                    ->default(now())
                    ->required()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user.email'),
                Tables\Columns\TextColumn::make('batch.name'),
                Tables\Columns\TextColumn::make('track.name'),
                Tables\Columns\TextColumn::make('payment.payment_reference'),
                Tables\Columns\TextColumn::make('status')->badge(),
                Tables\Columns\TextColumn::make('registration_date')->date(),
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
            'index' => Pages\ListUserBatches::route('/'),
            'create' => Pages\CreateUserBatch::route('/create'),
            'edit' => Pages\EditUserBatch::route('/{record}/edit'),
        ];
    }
}
