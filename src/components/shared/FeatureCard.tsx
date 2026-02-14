import { cn } from "zudoku";
import { type Status, StatusBadge } from "./StatusBadge.js";

export type FeatureCardProps = {
  title: string;
  description: string;
  icon: string;
  status: Status;
  className?: string;
};

export const FeatureCard = ({
  title,
  description,
  icon,
  status,
  className,
}: FeatureCardProps) => {
  return (
    <div
      className={cn(
        "group relative overflow-hidden rounded-lg border border-border bg-card p-6 transition-all duration-300 hover:shadow-lg",
        className,
      )}
    >
      <div className="flex flex-col gap-4">
        <div className="flex items-start justify-between">
          <span className="text-4xl" role="img" aria-label={title}>
            {icon}
          </span>
          <StatusBadge status={status} />
        </div>
        <div className="flex flex-col gap-2">
          <h3 className="text-xl font-semibold">{title}</h3>
          <p className="text-sm text-muted-foreground">{description}</p>
        </div>
      </div>
    </div>
  );
};
