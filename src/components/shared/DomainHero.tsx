import type { ReactNode } from "react";
import { cn } from "zudoku";

type DomainHeroProps = {
  title: string;
  description: string;
  badge?: string;
  icon?: ReactNode;
  className?: string;
};

export const DomainHero = ({
  title,
  description,
  badge,
  icon,
  className,
}: DomainHeroProps) => {
  return (
    <div
      className={cn(
        "relative overflow-hidden bg-gradient-to-br from-white to-gray-50 dark:from-gray-900 dark:to-gray-800 p-8 rounded-lg shadow-lg mb-8",
        className,
      )}
    >
      {/* Background decoration */}
      <div className="absolute top-0 right-0 w-64 h-64 bg-primary/5 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2" />
      <div className="absolute bottom-0 left-0 w-64 h-64 bg-primary/5 rounded-full blur-3xl translate-y-1/2 -translate-x-1/2" />

      <div className="relative z-10">
        <div className="flex items-start justify-between mb-6">
          <div className="flex items-start gap-4">
            {icon && (
              <div className="flex-shrink-0 w-12 h-12 flex items-center justify-center rounded-lg bg-primary/10 text-primary">
                {icon}
              </div>
            )}
            <div>
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
                {title}
              </h1>
              <p className="text-lg text-gray-600 dark:text-gray-300">
                {description}
              </p>
            </div>
          </div>
          {badge && (
            <div className="relative">
              <span className="inline-flex items-center px-4 py-2 rounded-full text-sm font-semibold bg-primary text-primaryForeground">
                {badge}
              </span>
              <span className="absolute inset-0 rounded-full bg-primary animate-ping opacity-30" />
            </div>
          )}
        </div>
      </div>
    </div>
  );
};
