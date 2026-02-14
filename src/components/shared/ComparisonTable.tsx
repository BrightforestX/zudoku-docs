import { cn } from "zudoku";

export type ComparisonTableProps = {
  headers: string[];
  rows: string[][];
  className?: string;
};

export const ComparisonTable = ({
  headers,
  rows,
  className,
}: ComparisonTableProps) => {
  return (
    <div className={cn("overflow-x-auto", className)}>
      <table className="w-full border-collapse">
        <thead>
          <tr className="border-b border-border bg-muted/50">
            {headers.map((header) => (
              <th
                key={header}
                className="px-4 py-3 text-left text-sm font-semibold"
              >
                {header}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => (
            <tr
              key={row[0]}
              className="border-b border-border last:border-b-0 hover:bg-muted/30 transition-colors"
            >
              {row.map((cell, cellIndex) => (
                <td
                  key={`${row[0]}-${cell}`}
                  className={cn(
                    "px-4 py-3 text-sm",
                    cellIndex === 0 ? "font-medium" : "text-muted-foreground",
                  )}
                >
                  {cell}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};
