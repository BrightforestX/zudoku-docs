import { cn } from "zudoku";

export type Step = {
  title: string;
  description: string;
};

export type StepByStepProps = {
  steps: Step[];
  className?: string;
};

export const StepByStep = ({ steps, className }: StepByStepProps) => {
  return (
    <div className={cn("relative space-y-8", className)}>
      {steps.map((step, index) => (
        <div key={step.title} className="relative flex gap-4">
          {/* Number circle with connecting line */}
          <div className="flex flex-col items-center">
            <div className="flex h-10 w-10 items-center justify-center rounded-full bg-primary text-primary-foreground font-semibold">
              {index + 1}
            </div>
            {index < steps.length - 1 && (
              <div className="w-0.5 flex-1 bg-border mt-2 min-h-[40px]" />
            )}
          </div>

          {/* Content */}
          <div className="flex-1 pb-8">
            <h3 className="text-xl font-semibold mb-2">{step.title}</h3>
            <p className="text-muted-foreground">{step.description}</p>
          </div>
        </div>
      ))}
    </div>
  );
};
