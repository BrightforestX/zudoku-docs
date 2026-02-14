import { cn } from "zudoku";
import { type Status, StatusBadge } from "./StatusBadge.js";

export type Domain = {
  name: string;
  tagline: string;
  status: Status;
  href?: string;
};

export type DomainGridProps = {
  className?: string;
};

const brightForestDomains: Domain[] = [
  {
    name: "Security",
    tagline: "Protect your infrastructure and data",
    status: "available",
  },
  {
    name: "Compliance",
    tagline: "Meet regulatory requirements effortlessly",
    status: "available",
  },
  {
    name: "Privacy",
    tagline: "Safeguard user data and privacy",
    status: "beta",
  },
  {
    name: "Infrastructure",
    tagline: "Manage and scale your infrastructure",
    status: "available",
  },
  {
    name: "Data",
    tagline: "Handle data pipelines and storage",
    status: "available",
  },
  {
    name: "AI",
    tagline: "Integrate AI capabilities seamlessly",
    status: "beta",
  },
  {
    name: "Platform",
    tagline: "Build and deploy applications faster",
    status: "available",
  },
  {
    name: "Integration",
    tagline: "Connect your tools and services",
    status: "available",
  },
  {
    name: "Monitoring",
    tagline: "Track system health and performance",
    status: "available",
  },
  {
    name: "Automation",
    tagline: "Automate workflows and processes",
    status: "available",
  },
  {
    name: "Analytics",
    tagline: "Gain insights from your data",
    status: "beta",
  },
  {
    name: "Communication",
    tagline: "Enable team collaboration",
    status: "coming-soon",
  },
  {
    name: "Workflow",
    tagline: "Orchestrate complex workflows",
    status: "coming-soon",
  },
];

export const DomainGrid = ({ className }: DomainGridProps) => {
  return (
    <div
      className={cn(
        "grid gap-4 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4",
        className,
      )}
    >
      {brightForestDomains.map((domain) => (
        <a
          key={domain.name}
          href={domain.href || `#${domain.name.toLowerCase()}`}
          className="group block rounded-lg border border-border bg-card p-4 transition-all duration-300 hover:shadow-md hover:border-primary"
        >
          <div className="flex flex-col gap-2">
            <div className="flex items-start justify-between">
              <h3 className="text-lg font-semibold group-hover:text-primary transition-colors">
                {domain.name}
              </h3>
              <StatusBadge status={domain.status} />
            </div>
            <p className="text-sm text-muted-foreground">{domain.tagline}</p>
          </div>
        </a>
      ))}
    </div>
  );
};
