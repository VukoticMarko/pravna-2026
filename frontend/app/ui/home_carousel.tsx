"use client";

import Link from "next/link";
import { useEffect, useRef, useState } from "react";
import {
  ChevronLeft,
  ChevronRight,
  FileText,
  Scale,
  BookOpen,
  FilePlus,
} from "lucide-react";

const slides = [
  {
    id: 0,
    title: "PDF Judgements",
    href: "/judgements_and_laws",
    Icon: FileText,
    description:
      "Browse all court judgements and laws stored as PDF documents. Quickly search, filter, and view the original scanned rulings from Montenegrin courts.",
    color: "from-blue-900 to-blue-700",
    glow: "rgba(59,130,246,0.35)",
  },
  {
    id: 1,
    title: "Akoma Ntoso Judgements",
    href: "/judgements",
    Icon: Scale,
    description:
      "Explore structured Akoma Ntoso XML representations of court judgements. Machine-readable legal documents with rich metadata for advanced analysis.",
    color: "from-purple-900 to-purple-700",
    glow: "rgba(147,51,234,0.35)",
  },
  {
    id: 2,
    title: "Montenegro Law",
    href: "/laws",
    Icon: BookOpen,
    description:
      "Access the full body of Montenegrin criminal law parsed into structured XML format, ready for legal research and cross-referencing with case documents.",
    color: "from-emerald-900 to-emerald-700",
    glow: "rgba(16,185,129,0.35)",
  },
  {
    id: 3,
    title: "New Judgement",
    href: "/new_judgement",
    Icon: FilePlus,
    description:
      "Manually create a new court judgement entry. Fill in case metadata and submit it directly to the system in Akoma Ntoso format.",
    color: "from-rose-900 to-rose-700",
    glow: "rgba(239,68,68,0.35)",
  },
];

const ROTATE_INTERVAL = 7000;

export function HomeCarousel() {
  const [active, setActive] = useState(0);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const goTo = (index: number) => {
    setActive((index + slides.length) % slides.length);
    resetTimer();
  };

  const resetTimer = () => {
    if (timerRef.current) clearInterval(timerRef.current);
    timerRef.current = setInterval(() => {
      setActive((prev) => (prev + 1) % slides.length);
    }, ROTATE_INTERVAL);
  };

  useEffect(() => {
    resetTimer();
    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
    };
  }, []);

  const slide = slides[active];

  return (
    <div className="relative flex items-center justify-center h-full w-full select-none">
      {/* Left Arrow */}
      <button
        onClick={() => goTo(active - 1)}
        className="absolute left-4 z-10 p-2 rounded-full bg-white/10 hover:bg-white/20 transition text-white"
        aria-label="Previous"
      >
        <ChevronLeft className="w-8 h-8" />
      </button>

      {/* Slide */}
      <div
        key={slide.id}
        className={`
          flex flex-col items-start justify-center
          w-full max-w-3xl mx-auto px-20 py-16
          rounded-2xl bg-gradient-to-br ${slide.color}
          shadow-2xl border border-white/10
          animate-fadeIn
        `}
        style={{ boxShadow: `0 0 60px 10px ${slide.glow}` }}
      >
        <slide.Icon className="w-16 h-16 text-white/80 mb-6" />
        <h2 className="text-4xl font-bold text-white mb-4">{slide.title}</h2>
        <p className="text-lg text-white/70 mb-10 leading-relaxed max-w-lg">
          {slide.description}
        </p>
        <Link
          href={slide.href}
          className="px-8 py-3 rounded-lg bg-white/20 hover:bg-white/30 text-white font-semibold text-base transition-all duration-200 border border-white/30"
        >
          Open {slide.title} →
        </Link>
      </div>

      {/* Right Arrow */}
      <button
        onClick={() => goTo(active + 1)}
        className="absolute right-4 z-10 p-2 rounded-full bg-white/10 hover:bg-white/20 transition text-white"
        aria-label="Next"
      >
        <ChevronRight className="w-8 h-8" />
      </button>

      {/* Dot Indicators */}
      <div className="absolute bottom-6 flex gap-2">
        {slides.map((s, i) => (
          <button
            key={s.id}
            onClick={() => goTo(i)}
            className={`
              w-2.5 h-2.5 rounded-full transition-all duration-300
              ${i === active ? "bg-white scale-125" : "bg-white/30"}
            `}
            aria-label={`Go to slide ${i + 1}`}
          />
        ))}
      </div>
    </div>
  );
}
