namespace :sync_api do
  desc "Sync cocktails and meals from external APIs"
  task sync_all: :environment do
    CocktailSyncService.sync
    MealSyncService.sync
  end
end
