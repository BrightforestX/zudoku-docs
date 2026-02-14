import { cn } from "zudoku";

type StatusBadgeProps = {
  status: "preview" | "coming-soon" | "stable" | "beta" | "deprecated";
  className?: string;
};

const statusStyles = {
  preview: "bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300",
  "coming-soon":
    "bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300",
  stable:
    "bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300",
  beta: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300",
  deprecated: "bg-red-100 text-red-800 dark:bg-red-900/30 dark:text-red-300",
};

const statusLabels = {
  preview: "Preview",
  "coming-soon": "Coming Soon",
  stable: "Stable",
  beta: "Beta",
  deprecated: "Deprecated",
};

export const StatusBadge = ({ status, className }: StatusBadgeProps) => {
  return (
    <span
      className={cn(
        "inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold",
        statusStyles[status],
        className,
      )}
    >
      {statusLabels[status]}
    </span>
  );
};
