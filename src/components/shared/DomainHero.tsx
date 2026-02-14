import { cn } from "zudoku";

export type DomainHeroProps = {
  title: string;
  description: string;
  image?: string;
  domain: string;
};

const domainGradients: Record<string, string> = {
  security: "from-red-500 to-pink-600",
  compliance: "from-blue-500 to-indigo-600",
  privacy: "from-purple-500 to-violet-600",
  infrastructure: "from-gray-500 to-slate-600",
  data: "from-cyan-500 to-teal-600",
  ai: "from-orange-500 to-amber-600",
  platform: "from-green-500 to-emerald-600",
  integration: "from-yellow-500 to-lime-600",
  monitoring: "from-fuchsia-500 to-pink-600",
  automation: "from-indigo-500 to-purple-600",
  analytics: "from-teal-500 to-cyan-600",
  communication: "from-rose-500 to-red-600",
  workflow: "from-violet-500 to-purple-600",
};

export const DomainHero = ({
  title,
  description,
  image,
  domain,
}: DomainHeroProps) => {
  const gradient =
    domainGradients[domain.toLowerCase()] || "from-gray-500 to-slate-600";

  return (
    <div
      className={cn(
        "relative w-full overflow-hidden rounded-lg bg-gradient-to-r p-8 md:p-12 lg:p-16",
        gradient,
      )}
    >
      <div className="relative z-10 mx-auto max-w-5xl">
        <div className="flex flex-col gap-4 md:gap-6">
          <div className="flex-1">
            <h1 className="mb-4 text-4xl font-bold text-white md:text-5xl lg:text-6xl">
              {title}
            </h1>
            <p className="text-lg text-white/90 md:text-xl lg:text-2xl">
              {description}
            </p>
          </div>
          {image && (
            <div className="flex-1">
              <img
                src={image}
                alt={title}
                className="h-auto w-full max-w-md rounded-lg shadow-xl"
              />
            </div>
          )}
        </div>
      </div>
      <div className="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent" />
    </div>
  );
};
