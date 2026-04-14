type TableProps = {
  columns: string[];
  data: Record<string, unknown>[];
};

/**
 * Data-driven table for MDX (replaces monorepo-only `Table` from embedded docs tooling).
 * Row keys should match column headers in lowercase (e.g. column "Score" → `score`).
 */
export function Table({ columns, data }: TableProps) {
  const keys = columns.map(columnToRowKey);
  return (
    <div className="my-4 overflow-x-auto">
      <table className="w-full border-collapse border text-sm">
        <thead>
          <tr>
            {columns.map((col) => (
              <th
                key={col}
                className="border border-border bg-muted px-3 py-2 text-left font-medium"
              >
                {col}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {data.map((row, rowIndex) => (
            <tr key={rowIndex}>
              {keys.map((key) => (
                <td key={key} className="border border-border px-3 py-2 align-top">
                  {formatCell(getCell(row, key))}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

/** Map MDX column label to typical row object key (handles "Project type" → projectType). */
function columnToRowKey(col: string): string {
  const t = col.trim();
  if (!t) return "";
  if (t.includes("-")) return t.toLowerCase();
  const words = t.split(/\s+/).filter(Boolean);
  if (words.length === 1) return words[0].toLowerCase();
  return (
    words[0].toLowerCase() +
    words
      .slice(1)
      .map((w) => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase())
      .join("")
  );
}

function getCell(row: Record<string, unknown>, key: string): unknown {
  if (key in row) return row[key];
  const lower = key.toLowerCase();
  if (lower in row) return row[lower];
  return undefined;
}

function formatCell(value: unknown): string {
  if (value == null) return "";
  if (typeof value === "string" || typeof value === "number" || typeof value === "boolean") {
    return String(value);
  }
  try {
    return JSON.stringify(value);
  } catch {
    return String(value);
  }
}
