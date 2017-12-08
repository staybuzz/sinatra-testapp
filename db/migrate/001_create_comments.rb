Sequel.migration do
  change do
    create_table(:comments) do
      primary_key :id
      String :name
      String :message, test: true
      Time:posted_date
    end
  end
end
