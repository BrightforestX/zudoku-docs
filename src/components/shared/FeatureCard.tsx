import type { ReactNode } from "react";
import { cn } from "zudoku";

type FeatureCardProps = {
  title: string;
  description: string;
  icon?: ReactNode;
  href?: string;
  className?: string;
};

export const FeatureCard = ({
  title,
  description,
  icon,
  href,
  className,
}: FeatureCardProps) => {
  const Component = href ? "a" : "div";
  const linkProps = href ? { href } : {};

  return (
    <Component
      {...linkProps}
      className={cn(
        "flex flex-col gap-3 p-6 rounded-lg",
        "bg-white dark:bg-gray-800",
        "border border-gray-200 dark:border-gray-700",
        "transition-all duration-200",
        href &&
          "hover:border-primary/50 hover:shadow-lg hover:scale-105 cursor-pointer",
        className,
      )}
    >
      {icon && (
        <div className="w-10 h-10 flex items-center justify-center rounded-lg bg-primary/10 text-primary">
          {icon}
        </div>
      )}
      <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
        {title}
      </h3>
      <p className="text-gray-600 dark:text-gray-300">{description}</p>
    </Component>
  );
};
