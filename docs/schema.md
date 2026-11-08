# Data Schema MVP 

## Enum: TaskType
- `required` (divides score when not completed, daily, multiplier < 1.0)
- `incentive` (multiplies dialy score when completed, daily, multiplier > 1.0)
- `checkable` (adds points when completed, disposes next day after complition)
- `countable` (adds `value + subValue * count` points for complition, disposes next day after complition)

## Collection: ItemTask
- `id`: Id (Isar.autoIncrement)
- `title`: String (task text)
- `type`: TaskType
- `value`: double (multiplier or points cost)
- `subValue`: double (point cost for each complition, 0.0 by default)
- `isCompleted`: bool (false by default)
- `count`: int
- `assignedDate`: DateTime
- `completedDate`: DateTime?

## Collection: DayProgress
- `id`: Id (Isar.autoIncrement)
- `date`: DateTime
- `totalScore`: int

## Collection: ValuePrefab (stored custom values)
- `id`: Id (Isar.autoIncrement)
- `title`: String
- `type`: TaskType (only checkable and countable)
- `value`: double
- `subValue`: double 