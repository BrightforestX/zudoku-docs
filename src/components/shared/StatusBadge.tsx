import { cn } from "zudoku";

export type Status = "available" | "coming-soon" | "beta";

export type StatusBadgeProps = {
  status: Status;
};

const statusConfig: Record<Status, { label: string; className: string }> = {
  available: {
    label: "Available",
    className:
      "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  },
  "coming-soon": {
    label: "Coming Soon",
    className:
      "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  },
  beta: {
    label: "Beta",
    className: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  },
};

export const StatusBadge = ({ status }: StatusBadgeProps) => {
  const config = statusConfig[status];

  return (
    <span
      className={cn(
        "inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium",
        config.className,
      )}
    >
      {config.label}
    </span>
  );
};
