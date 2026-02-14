import type { ReactNode } from "react";
import { cn } from "zudoku";

type DomainItem = {
  name: string;
  domain: string;
  description: string;
  icon?: ReactNode;
  status?: "preview" | "coming-soon" | "stable" | "beta";
  href?: string;
};

type DomainGridProps = {
  domains: DomainItem[];
  columns?: 1 | 2 | 3 | 4;
  className?: string;
};

const statusStyles = {
  preview: "bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300",
  "coming-soon":
    "bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300",
  stable:
    "bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300",
  beta: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300",
};

const statusLabels = {
  preview: "Preview",
  "coming-soon": "Coming Soon",
  stable: "Stable",
  beta: "Beta",
};

const columnClasses = {
  1: "grid-cols-1",
  2: "grid-cols-1 md:grid-cols-2",
  3: "grid-cols-1 md:grid-cols-2 lg:grid-cols-3",
  4: "grid-cols-1 md:grid-cols-2 lg:grid-cols-4",
};

export const DomainGrid = ({
  domains,
  columns = 3,
  className,
}: DomainGridProps) => {
  return (
    <div className={cn("grid gap-6", columnClasses[columns], className)}>
      {domains.map((domain) => {
        const Component = domain.href ? "a" : "div";
        const linkProps = domain.href ? { href: domain.href } : {};

        return (
          <Component
            key={domain.domain}
            {...linkProps}
            className={cn(
              "flex flex-col gap-3 p-6 rounded-lg",
              "bg-white dark:bg-gray-800",
              "border border-gray-200 dark:border-gray-700",
              "transition-all duration-200",
              domain.href &&
                "hover:border-primary/50 hover:shadow-lg hover:scale-105 cursor-pointer",
            )}
          >
            <div className="flex items-start justify-between gap-3">
              <div className="flex items-start gap-3 flex-1">
                {domain.icon && (
                  <div className="w-10 h-10 flex-shrink-0 flex items-center justify-center rounded-lg bg-primary/10 text-primary">
                    {domain.icon}
                  </div>
                )}
                <div className="flex-1 min-w-0">
                  <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-1">
                    {domain.name}
                  </h3>
                  <code className="text-xs text-gray-500 dark:text-gray-400 break-all">
                    {domain.domain}
                  </code>
                </div>
              </div>
              {domain.status && (
                <span
                  className={cn(
                    "inline-flex items-center px-2 py-1 rounded-full text-xs font-semibold flex-shrink-0",
                    statusStyles[domain.status],
                  )}
                >
                  {statusLabels[domain.status]}
                </span>
              )}
            </div>
            <p className="text-sm text-gray-600 dark:text-gray-300">
              {domain.description}
            </p>
          </Component>
        );
      })}
    </div>
  );
};
