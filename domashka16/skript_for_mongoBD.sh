// Крок 1: Створення бази даних "gymDatabase"
use gymDatabase

// Крок 2: Створення колекції "clients" з схемою
db.createCollection("clients", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["client_id", "name", "age", "email"],
      properties: {
        client_id: { bsonType: "string" },
        name: { bsonType: "string" },
        age: { bsonType: "int" },
        email: { bsonType: "string" }
      }
    }
  }
})

// Крок 3: Створення колекції "memberships" з схемою
db.createCollection("memberships", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["membership_id", "client_id", "start_date", "end_date", "type"],
      properties: {
        membership_id: { bsonType: "string" },
        client_id: { bsonType: "string" },
        start_date: { bsonType: "date" },
        end_date: { bsonType: "date" },
        type: { bsonType: "string" }
      }
    }
  }
})

// Крок 4: Створення колекції "workouts" з схемою
db.createCollection("workouts", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["workout_id", "description", "difficulty"],
      properties: {
        workout_id: { bsonType: "string" },
        description: { bsonType: "string" },
        difficulty: { bsonType: "string" }
      }
    }
  }
})

// Крок 5: Створення колекції "trainers" з схемою
db.createCollection("trainers", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["trainer_id", "name", "specialization"],
      properties: {
        trainer_id: { bsonType: "string" },
        name: { bsonType: "string" },
        specialization: { bsonType: "string" }
      }
    }
  }
})

// Крок 6: Додавання даних до колекцій

// Додавання даних до колекції "clients"
db.clients.insertMany([
  { client_id: "1", name: "Alice", age: 35, email: "alice@example.com" },
  { client_id: "2", name: "Bob", age: 28, email: "bob@example.com" },
  // Додайте інші записи за потребою
])

// Додавання даних до колекції "memberships"
db.memberships.insertMany([
  { membership_id: "101", client_id: "1", start_date: ISODate("2022-01-01"), end_date: ISODate("2023-01-01"), type: "Gold" },
  { membership_id: "102", client_id: "2", start_date: ISODate("2022-02-01"), end_date: ISODate("2022-08-01"), type: "Silver" },
  // Додайте інші записи за потребою
])

// Додавання даних до колекції "workouts"
db.workouts.insertMany([
  { workout_id: "201", description: "Cardio", difficulty: "Intermediate" },
  { workout_id: "202", description: "Strength Training", difficulty: "Advanced" },
  // Додайте інші записи за потребою
])

// Додавання даних до колекції "trainers"
db.trainers.insertMany([
  { trainer_id: "301", name: "John Trainer", specialization: "Cardio" },
  { trainer_id: "302", name: "Alice Coach", specialization: "Strength Training" },
  // Додайте інші записи за потребою
])


# Знайдіть всіх клієнтів віком понад 30 років:
# db.clients.find({ age: { $gt: 30 } })

# Перелічте тренування із середньою складністю:
# db.workouts.find({ difficulty: "Intermediate" })

# Покажіть інформацію про членство клієнта з певним client_id:
# db.memberships.find({ client_id: "1" })

