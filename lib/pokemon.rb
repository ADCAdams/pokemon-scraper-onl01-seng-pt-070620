class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id 
  
  def initialize(id: nil, name: nil, type: nil, db: nil)
    @name = name
    @type = type 
    @id = id 
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      SQL
      found_array = db.execute(sql, id)
      new_pok = Pokemon.new(id: found_array[0][0], name: found_array[0][1], type: found_array[0][2])
      new_pok
  end   #end find
  
  
  
  
end
