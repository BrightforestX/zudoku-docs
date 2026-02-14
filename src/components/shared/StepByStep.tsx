import type { ReactNode } from "react";
import { cn } from "zudoku";

type Step = {
  title: string;
  description: string;
  icon?: ReactNode;
};

type StepByStepProps = {
  steps: Step[];
  className?: string;
};

export const StepByStep = ({ steps, className }: StepByStepProps) => {
  return (
    <div className={cn("space-y-6", className)}>
      {steps.map((step, index) => (
        <div key={`${step.title}-${index}`} className="flex gap-4">
          <div className="flex flex-col items-center">
            <div className="w-10 h-10 flex-shrink-0 flex items-center justify-center rounded-full bg-primary text-primaryForeground font-semibold">
              {step.icon || index + 1}
            </div>
            {index < steps.length - 1 && (
              <div className="w-0.5 flex-1 mt-2 bg-gray-200 dark:bg-gray-700 min-h-[2rem]" />
            )}
          </div>
          <div className="flex-1 pb-6">
            <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
              {step.title}
            </h3>
            <p className="text-gray-600 dark:text-gray-300">
              {step.description}
            </p>
          </div>
        </div>
      ))}
    </div>
  );
};
