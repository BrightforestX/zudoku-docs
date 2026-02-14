import type { ReactNode } from "react";
import { cn } from "zudoku";

type ComparisonRow = {
  feature: string;
  [key: string]: ReactNode;
};

type ComparisonTableProps = {
  columns: string[];
  rows: ComparisonRow[];
  className?: string;
};

export const ComparisonTable = ({
  columns,
  rows,
  className,
}: ComparisonTableProps) => {
  return (
    <div className={cn("overflow-x-auto", className)}>
      <table className="w-full border-collapse">
        <thead>
          <tr className="border-b border-gray-200 dark:border-gray-700">
            <th className="text-left p-4 font-semibold text-gray-900 dark:text-white">
              Feature
            </th>
            {columns.map((column) => (
              <th
                key={column}
                className="text-center p-4 font-semibold text-gray-900 dark:text-white"
              >
                {column}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((row, index) => (
            <tr
              key={`${row.feature}-${index}`}
              className="border-b border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-800/50"
            >
              <td className="p-4 text-gray-700 dark:text-gray-300">
                {row.feature}
              </td>
              {columns.map((column) => (
                <td
                  key={column}
                  className="p-4 text-center text-gray-600 dark:text-gray-400"
                >
                  {row[column]}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};
