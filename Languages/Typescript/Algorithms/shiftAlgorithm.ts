type SelectedRows = Set<number>[];

const handleShiftSelection = (props: {
  newRow: number;
  rows: SelectedRows;
  pivot: number;
}): SelectedRows => {
  const { newRow, rows, pivot } = props;
  const up = pivot > newRow;
  const down = pivot < newRow;
  const setToAdd = new Set([]);
  const lastSet = rows[rows.length - 1];

  const isPivotInDataUp =
    pivot !== null &&
    lastSet?.has(pivot) &&
    pivot > newRow &&
    Math.min(...lastSet) > newRow &&
    pivot === Math.min(...lastSet);
  const isPivotInDataDown =
    pivot !== null &&
    lastSet?.has(pivot) &&
    pivot < newRow &&
    Math.min(...lastSet) < newRow &&
    pivot === Math.max(...lastSet);

  if (isPivotInDataUp) {
    rows.pop();

    for (let i = newRow; i <= pivot; i++) {
      setToAdd.add(i);
    }
  } else if (isPivotInDataDown) {
    rows.pop();

    for (let i = pivot; i <= newRow; i++) {
      setToAdd.add(i);
    }
  } else if (pivot === null) {
    for (let i = 0; i <= newRow; i++) {
      setToAdd.add(i);
    }
  } else if (!isPivotInDataUp) {
    if (down) {
      for (let i = pivot; i <= newRow; i++) {
        setToAdd.add(i);
      }
    } else if (up) {
      for (let i = newRow; i <= pivot; i++) {
        setToAdd.add(i);
      }
    }
  }
  if (setToAdd.size) {
    rows.push(setToAdd);
  }

  return rows;
};
