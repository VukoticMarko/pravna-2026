"use client";

import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { Form, FormControl, FormDescription, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { useState } from "react";
import Link from "next/link";
import {
  Scale,
  User,
  Gavel,
  BookOpen,
  Send,
  Search,
  FileText,
  TrendingUp,
  AlertCircle,
  CheckCircle2,
  ChevronRight,
  ExternalLink,
} from "lucide-react";

const sudovi = [
  "Vrhovni Sud CG",
  "Apelacioni Sud CG",
  "Upravni Sud CG",
  "Privredni Sud Crne Gore",
  "Viši Sud u Podgorici",
  "Viši Sud u Bijelom Polju",
  "Privredni Sud Bijelo Polje",
  "Osnovni Sud u Baru",
  "Osnovni Sud u Beranama",
  "Osnovni Sud u Bijelom Polju",
  "Osnovni Sud u Cetinju",
  "Osnovni Sud u Danilovgradu",
  "Osnovni Sud u Herceg Novom",
  "Osnovni Sud u Kolašinu",
  "Osnovni Sud u Kotoru",
  "Osnovni Sud u Nikšiću",
  "Osnovni Sud u Plavu",
  "Osnovni Sud u Pljevljima",
  "Osnovni Sud u Podgorici",
  "Osnovni Sud u Rožajama",
  "Osnovni Sud u Ulcinju",
  "Osnovni Sud u Žabljaku",
  "Viši Sud za prekršaje Crne Gore",
  "Sud za prekršaje u Bijelom Polju",
  "Sud za prekršaje u Budvi",
  "Sud za prekršaje u Podgorici",
] as const;

const kradje = [
  "robbery",
  "kradja",
  "teska kradja",
  "razbojnicka kradja",
] as const;

const nameraKradje = [
  "own_illegal_property_benefit",
  "stealing_property",
  "own_benefit",
  "someones_benefit",
  "keeps_stolen_thing",
  "uses_force",
  "threatens_to_attack",
  "someones_illegal_property_benefit",
  "appropriates_movable_property",
] as const;

const nacinKradje = [
  "standard",
  "breaking_into_closed_buildings",
  "group",
  "very_dangerous",
  "very_rude",
  "with_weapon",
  "during_natural_accident",
  "taking_advantage_of_peoples_helplessness",
  "group_or_seriously_injured",
  "deprived_of_life",
] as const;

const formSchema = z.object({
  sud: z.enum(sudovi, { required_error: "Please choose one court." }),
  sudija: z.string().min(2).max(100),
  brojPresude: z.number().int().positive(),
  optuzeni: z.string().min(2).max(100),
  tuzilac: z.enum(["osnovni", "visi"], { required_error: "Please choose one plaintiff." }),
  vrednostUkradenihStvari: z.number().int().positive(),
  clanoviKrivicnihDela: z.string().max(100),
  clanoviOptuzbe: z.string().max(100),
  tipKradje: z.enum(kradje, { required_error: "Please choose theft type." }),
  namera: z.enum(nameraKradje, { required_error: "Please choose one intention." }),
  nacinKradje: z.enum(nacinKradje, { required_error: "Please choose type of theft." }),
  sankcija: z.string().max(10000),
  kazna: z.string().max(10000),
  obrazlozenje: z.string().max(10000),
});

const translate = (
  stealType: (typeof kradje)[number],
  intention: (typeof nameraKradje)[number],
  stealWay: (typeof nacinKradje)[number]
) => {
  const translations: Record<string, string> = {
    robbery: "razbojnistvo",
    competition_outcome_arrangement: "dogovaranje ishoda takmicenja",
    kradja: "kradja",
    "teska kradja": "teska kradja",
    "razbojnicka kradja": "razbojnicka kradja",
    prevara: "prevara",
    keeps_stolen_thing: "zadrzava ukradenu imovinu",
    uses_force: "koristi silu",
    threatens_to_attack: "preti napadom",
    own_benefit: "za sopstvenu korist",
    someones_benefit: "za tudju korist",
    standard: "standardno",
    group_or_seriously_injured: "grupno ili ozbiljno povredjen",
    deprived_of_life: "lisen zivota",
    own_illegal_property_benefit: "za sopstvenu ilegalnu korist",
    someones_illegal_property_benefit: "za tudju ilegalnu korist",
    stealing_property: "kradja imovine",
    appropriates_movable_property: "prisvaja pokretnu imovinu",
    breaking_into_closed_buildings: "provala u zatvoreno imanje",
    group: "grupno",
    very_dangerous: "veoma opasno",
    very_rude: "veoma bezobrazno",
    with_weapon: "oruzjem",
    during_natural_accident: "tokom prirodnih nepogoda",
    taking_advantage_of_peoples_helplessness: "iskoriscava ljudske nemoci",
  };
  return {
    stealType: translations[stealType],
    intention: translations[intention],
    stealWay: translations[stealWay],
  };
};

function SectionHeader({ icon: Icon, title }: { icon: any; title: string }) {
  return (
    <div className="flex items-center gap-2 pb-1 mb-3 border-b border-white/10">
      <div className="p-1.5 rounded-md bg-purple-500/20">
        <Icon className="w-3.5 h-3.5 text-purple-400" />
      </div>
      <span className="text-xs font-semibold text-purple-300 uppercase tracking-wider">{title}</span>
    </div>
  );
}

function SimilarCaseCard({ caseResult, index }: { caseResult: any; index: number }) {
  const [open, setOpen] = useState(false);
  const similarity = (caseResult.jaccard_similarity * 100).toFixed(1);
  const isHigh = parseFloat(similarity) >= 70;
  const isMed = parseFloat(similarity) >= 40;
  const caseId: string | undefined = caseResult.broj_slucaja;

  return (
    <div className="border border-white/10 rounded-lg overflow-hidden mb-2 last:mb-0">
      <button
        onClick={() => setOpen(!open)}
        className="w-full flex items-center justify-between px-4 py-2.5 bg-white/5 hover:bg-white/8 transition-colors text-left"
      >
        <div className="flex items-center gap-3">
          <span className="text-xs text-muted-foreground">Case #{index + 1}</span>
          {caseId && <span className="text-xs font-mono text-muted-foreground">{caseId}</span>}
          <Badge
            className={
              isHigh
                ? "bg-green-500/20 text-green-300 border-green-500/30"
                : isMed
                ? "bg-yellow-500/20 text-yellow-300 border-yellow-500/30"
                : "bg-red-500/20 text-red-300 border-red-500/30"
            }
          >
            {similarity}% match
          </Badge>
        </div>
        <div className="flex items-center gap-2">
          {caseId && (
            <>
              <Link
                href={`/judgements_and_laws?case=${encodeURIComponent(caseId)}`}
                onClick={(e) => e.stopPropagation()}
                title="Open PDF Judgement"
                className="flex items-center gap-1 text-[10px] text-orange-300 hover:text-orange-200 border border-orange-500/30 rounded px-1.5 py-0.5 hover:bg-orange-500/10 transition-colors"
              >
                <FileText className="w-3 h-3" />
                PDF
              </Link>
              <Link
                href={`/judgements?case=${encodeURIComponent(caseId)}`}
                onClick={(e) => e.stopPropagation()}
                title="Open Akoma Ntoso Judgement"
                className="flex items-center gap-1 text-[10px] text-purple-300 hover:text-purple-200 border border-purple-500/30 rounded px-1.5 py-0.5 hover:bg-purple-500/10 transition-colors"
              >
                <ExternalLink className="w-3 h-3" />
                AKN
              </Link>
            </>
          )}
          <ChevronRight className={`w-4 h-4 text-muted-foreground transition-transform ${open ? "rotate-90" : ""}`} />
        </div>
      </button>
      {open && (
        <div className="px-4 py-3 bg-black/20">
          <div className="grid grid-cols-2 gap-x-4 gap-y-1.5">
            {Object.entries(caseResult)
              .filter(([k]) => k !== "jaccard_similarity")
              .map(([key, value], idx) => (
                <div key={idx} className="flex flex-col">
                  <span className="text-[10px] text-muted-foreground uppercase tracking-wide">{key.replace(/_/g, " ")}</span>
                  <span className="text-xs text-foreground">{JSON.stringify(value)}</span>
                </div>
              ))}
          </div>
        </div>
      )}
    </div>
  );
}

export default function NovaPresuda() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      sudija: "",
      brojPresude: 1,
      optuzeni: "",
      vrednostUkradenihStvari: 500,
      clanoviKrivicnihDela: "",
      clanoviOptuzbe: "",
      sankcija: "",
      kazna: "",
      obrazlozenje: "",
    },
  });
  const { watch } = form;
  const tipKradje = watch("tipKradje");

  const [submitted, setSubmitted] = useState(false);
  const [caseBasedResult, setCaseBasedResult] = useState<any[]>([]);
  const [ruleBasedResult, setRuleBasedResult] = useState<string>("");
  const [loadingCbr, setLoadingCbr] = useState(false);
  const [loadingRbr, setLoadingRbr] = useState(false);

  const onSubmit = async (values: z.infer<typeof formSchema>) => {
    const { stealType, intention, stealWay } = translate(values.tipKradje, values.namera, values.nacinKradje);
    const caseDTO = {
      court: values.sud,
      caseNumber: `K ${values.brojPresude}/2026`,
      judge: values.sudija,
      defendant: values.optuzeni,
      plaintiff: values.tuzilac,
      valueOfStolenThings: values.vrednostUkradenihStvari,
      criminalAct: stealType,
      articlesCriminalAct: values.clanoviKrivicnihDela,
      articlesCondemnation: values.clanoviOptuzbe,
      intention,
      stealWay,
      punishment: values.kazna,
    };
    try {
      await fetch("http://localhost:8080/api/verdicts", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(caseDTO),
      });
    } catch (error) {
      console.error("Error submitting verdict:", error);
    }
    try {
      await fetch("http://localhost:3000/api/save_case", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          ...caseDTO,
          sanction: values.sankcija,
          explanation: values.obrazlozenje,
          fileName: `K ${values.brojPresude} 2026`,
        }),
      });
    } catch (error) {
      console.error("Error saving case:", error);
    }
    setSubmitted(true);
  };

  const getCaseBasedReasoning = async (values: z.infer<typeof formSchema>) => {
    const { stealType, intention, stealWay } = translate(values.tipKradje, values.namera, values.nacinKradje);
    setLoadingCbr(true);
    try {
      const response = await fetch("http://localhost:8080/api/cbr/reason", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          court: values.sud,
          caseNumber: `K ${values.brojPresude}/2026`,
          judge: values.sudija,
          defendant: values.optuzeni,
          plaintiff: values.tuzilac,
          valueOfStolenThings: values.vrednostUkradenihStvari,
          criminalAct: stealType,
          articlesCriminalAct: values.clanoviKrivicnihDela,
          articlesCondemnation: values.clanoviOptuzbe,
          intention,
          stealWay,
          punishment: values.kazna,
        }),
      });
      const result = await response.json();
      setCaseBasedResult(result);
    } catch (error) {
      console.error("Error fetching CBR:", error);
    } finally {
      setLoadingCbr(false);
    }
  };

  const getRuleBasedReasoning = async (values: z.infer<typeof formSchema>) => {
    setLoadingRbr(true);
    try {
      const response = await fetch("http://localhost:8080/api/rbr/reason", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          name: `K_${values.brojPresude}_2026`,
          defendant: values.optuzeni,
          money: values.vrednostUkradenihStvari,
          stealType: values.tipKradje,
          intention: values.namera,
          stealWay: values.nacinKradje,
        }),
      });
      const result = await response.text();
      setRuleBasedResult(result);
    } catch (error) {
      console.error("Error fetching RBR:", error);
    } finally {
      setLoadingRbr(false);
    }
  };

  const getIntentionOptions = () => {
    switch (tipKradje) {
      case "robbery":
        return (
          <>
            <SelectItem value="keeps_stolen_thing">Keeps stolen property (Zadržava ukradenu imovinu)</SelectItem>
            <SelectItem value="uses_force">Uses force (Koristi silu)</SelectItem>
            <SelectItem value="threatens_to_attack">Threatens to attack (Prijeti napadom)</SelectItem>
          </>
        );
      case "kradja":
        return (
          <>
            <SelectItem value="own_illegal_property_benefit">For own benefit (Za sopstvenu korist)</SelectItem>
            <SelectItem value="someones_illegal_property_benefit">For someone else's benefit (Za tuđu korist)</SelectItem>
          </>
        );
      case "teska kradja":
        return <SelectItem value="stealing_property">Stealing property (Krađa imovine)</SelectItem>;
      case "razbojnicka kradja":
        return (
          <>
            <SelectItem value="keeps_stolen_thing">Keeps stolen property (Čuva ukradenu stvar)</SelectItem>
            <SelectItem value="uses_force">Uses force (Koristi silu)</SelectItem>
            <SelectItem value="threatens_to_attack">Threatens to attack (Prijetnja napada)</SelectItem>
          </>
        );
      default:
        return null;
    }
  };

  const getStealWayOptions = () => {
    switch (tipKradje) {
      case "robbery":
        return (
          <>
            <SelectItem value="standard">Standard (Standardno)</SelectItem>
            <SelectItem value="group_or_seriously_injured">Group or seriously injured (Grupno ili ozbiljno povrijeđen)</SelectItem>
            <SelectItem value="deprived_of_life">Deprived of life (Lišen života)</SelectItem>
          </>
        );
      case "kradja":
        return <SelectItem value="standard">Standard (Standardno)</SelectItem>;
      case "teska kradja":
        return (
          <>
            <SelectItem value="breaking_into_closed_buildings">Breaking into closed buildings (Provala u zatvoreno imanje)</SelectItem>
            <SelectItem value="group">Group (Grupno)</SelectItem>
            <SelectItem value="very_dangerous">Very dangerous (Veoma opasno)</SelectItem>
            <SelectItem value="very_rude">Very rude (Veoma bezobrazno)</SelectItem>
            <SelectItem value="with_weapon">With weapon (Oružjem)</SelectItem>
            <SelectItem value="during_natural_accident">During natural accident (Tokom prirodnih nepogoda)</SelectItem>
            <SelectItem value="taking_advantage_of_peoples_helplessness">Taking advantage of people's helplessness (Iskorišćavanje ljudske nemoći)</SelectItem>
          </>
        );
      case "razbojnicka kradja":
        return (
          <>
            <SelectItem value="standard">Standard (Običan)</SelectItem>
            <SelectItem value="group_or_seriously_injured">Group or seriously injured (Grupno ili nanijete teške povrede)</SelectItem>
            <SelectItem value="deprived_of_life">Deprived of life (Lišen života)</SelectItem>
          </>
        );
      default:
        return null;
    }
  };

  return (
    <div className="flex h-full flex-row overflow-hidden gap-5 p-2">
      {/* ── LEFT: FORM ── */}
      <div className="w-[480px] shrink-0 flex flex-col h-full">
        <Form {...form}>
          <form className="flex flex-col h-full" onSubmit={form.handleSubmit(onSubmit)}>
            <Card className="flex flex-col h-full border-white/10 bg-black/30 backdrop-blur-sm overflow-hidden">
              {/* Header */}
              <CardHeader className="border-b border-white/10 pb-4 shrink-0 bg-gradient-to-r from-purple-900/30 to-transparent">
                <div className="flex items-center gap-3">
                  <div className="p-2 rounded-lg bg-purple-500/20 ring-1 ring-purple-500/30">
                    <Gavel className="w-5 h-5 text-purple-400" />
                  </div>
                  <div>
                    <CardTitle className="text-base font-semibold">New Judgement</CardTitle>
                    <p className="text-xs text-muted-foreground mt-0.5">Register a new court verdict</p>
                  </div>
                  {submitted && (
                    <Badge className="ml-auto bg-green-500/20 text-green-300 border-green-500/30 gap-1">
                      <CheckCircle2 className="w-3 h-3" /> Saved
                    </Badge>
                  )}
                </div>
              </CardHeader>

              {/* Form fields */}
              <CardContent className="flex-1 min-h-0 p-0">
                <ScrollArea className="h-full" type="always">
                  <div className="p-5 space-y-6">
                    {/* Section: Court Info */}
                    <section>
                      <SectionHeader icon={Scale} title="Court Information" />
                      <div className="space-y-3">
                        <div className="grid grid-cols-5 gap-3">
                          <FormField
                            control={form.control}
                            name="sud"
                            render={({ field }) => (
                              <FormItem className="col-span-3">
                                <FormLabel className="text-xs text-muted-foreground">Court</FormLabel>
                                <Select onValueChange={field.onChange} defaultValue={field.value}>
                                  <FormControl>
                                    <SelectTrigger className="h-9 text-xs bg-white/5 border-white/10">
                                      <SelectValue placeholder="Select court" />
                                    </SelectTrigger>
                                  </FormControl>
                                  <SelectContent>
                                    {sudovi.map((sud, i) => (
                                      <SelectItem key={i} value={sud} className="text-xs">
                                        {sud}
                                      </SelectItem>
                                    ))}
                                  </SelectContent>
                                </Select>
                                <FormMessage />
                              </FormItem>
                            )}
                          />
                          <FormField
                            control={form.control}
                            name="brojPresude"
                            render={({ field }) => (
                              <FormItem className="col-span-2">
                                <FormLabel className="text-xs text-muted-foreground">Case No.</FormLabel>
                                <FormControl>
                                  <div className="flex items-center gap-1 h-9 bg-white/5 border border-white/10 rounded-md px-2">
                                    <span className="text-xs text-muted-foreground font-mono">K</span>
                                    <Input
                                      className="border-0 bg-transparent h-full text-xs text-center p-0 focus-visible:ring-0 font-mono"
                                      onChange={(e) => form.setValue("brojPresude", parseInt(e.target.value || "0"))}
                                      defaultValue={field.value}
                                      type="number"
                                    />
                                    <span className="text-xs text-muted-foreground font-mono">/26</span>
                                  </div>
                                </FormControl>
                                <FormMessage />
                              </FormItem>
                            )}
                          />
                        </div>
                      </div>
                    </section>

                    {/* Section: Parties */}
                    <section>
                      <SectionHeader icon={User} title="Parties" />
                      <div className="space-y-3">
                        <FormField
                          control={form.control}
                          name="sudija"
                          render={({ field }) => (
                            <FormItem>
                              <FormLabel className="text-xs text-muted-foreground">Judge</FormLabel>
                              <FormControl>
                                <Input {...field} className="h-9 text-xs bg-white/5 border-white/10" placeholder="Judge name" />
                              </FormControl>
                              <FormMessage />
                            </FormItem>
                          )}
                        />
                        <div className="grid grid-cols-2 gap-3">
                          <FormField
                            control={form.control}
                            name="optuzeni"
                            render={({ field }) => (
                              <FormItem>
                                <FormLabel className="text-xs text-muted-foreground">Defendant</FormLabel>
                                <FormControl>
                                  <Input {...field} className="h-9 text-xs bg-white/5 border-white/10" placeholder="Initials" />
                                </FormControl>
                                <FormMessage />
                              </FormItem>
                            )}
                          />
                          <FormField
                            control={form.control}
                            name="tuzilac"
                            render={({ field }) => (
                              <FormItem>
                                <FormLabel className="text-xs text-muted-foreground">Plaintiff</FormLabel>
                                <Select onValueChange={field.onChange} defaultValue={field.value}>
                                  <FormControl>
                                    <SelectTrigger className="h-9 text-xs bg-white/5 border-white/10">
                                      <SelectValue placeholder="Type" />
                                    </SelectTrigger>
                                  </FormControl>
                                  <SelectContent>
                                    <SelectItem value="osnovni">Basic Court (Osnovni sud)</SelectItem>
                                    <SelectItem value="visi">High Court (Viši sud)</SelectItem>
                                  </SelectContent>
                                </Select>
                                <FormMessage />
                              </FormItem>
                            )}
                          />
                        </div>
                      </div>
                    </section>

                    {/* Section: Crime Details */}
                    <section>
                      <SectionHeader icon={AlertCircle} title="Crime Details" />
                      <div className="space-y-3">
                        <div className="grid grid-cols-2 gap-3">
                          <FormField
                            control={form.control}
                            name="tipKradje"
                            render={({ field }) => (
                              <FormItem>
                                <FormLabel className="text-xs text-muted-foreground">Theft Type</FormLabel>
                                <Select onValueChange={field.onChange} defaultValue={field.value}>
                                  <FormControl>
                                    <SelectTrigger className="h-9 text-xs bg-white/5 border-white/10">
                                      <SelectValue placeholder="Select type" />
                                    </SelectTrigger>
                                  </FormControl>
                                  <SelectContent>
                                    <SelectItem value="robbery">Robbery (Razbojništvo)</SelectItem>
                                    <SelectItem value="kradja">Theft (Krađa)</SelectItem>
                                    <SelectItem value="teska kradja">Aggravated Theft (Teška krađa)</SelectItem>
                                    <SelectItem value="razbojnicka kradja">Predatory Theft (Razbojnička krađa)</SelectItem>
                                  </SelectContent>
                                </Select>
                                <FormMessage />
                              </FormItem>
                            )}
                          />
                          <FormField
                            control={form.control}
                            name="vrednostUkradenihStvari"
                            render={({ field }) => (
                              <FormItem>
                                <FormLabel className="text-xs text-muted-foreground">Stolen Value (€)</FormLabel>
                                <FormControl>
                                  <Input
                                    className="h-9 text-xs bg-white/5 border-white/10 text-right font-mono"
                                    onChange={(e) => form.setValue("vrednostUkradenihStvari", parseInt(e.target.value || "0"))}
                                    defaultValue={field.value}
                                    type="number"
                                  />
                                </FormControl>
                                <FormMessage />
                              </FormItem>
                            )}
                          />
                        </div>
                        {tipKradje && (
                          <div className="grid grid-cols-2 gap-3">
                            <FormField
                              control={form.control}
                              name="namera"
                              render={({ field }) => (
                                <FormItem>
                                  <FormLabel className="text-xs text-muted-foreground">Intention</FormLabel>
                                  <Select onValueChange={field.onChange} defaultValue={field.value}>
                                    <FormControl>
                                      <SelectTrigger className="h-9 text-xs bg-white/5 border-white/10">
                                        <SelectValue placeholder="Select intention" />
                                      </SelectTrigger>
                                    </FormControl>
                                    <SelectContent>{getIntentionOptions()}</SelectContent>
                                  </Select>
                                  <FormMessage />
                                </FormItem>
                              )}
                            />
                            <FormField
                              control={form.control}
                              name="nacinKradje"
                              render={({ field }) => (
                                <FormItem>
                                  <FormLabel className="text-xs text-muted-foreground">Mode of Action</FormLabel>
                                  <Select onValueChange={field.onChange} defaultValue={field.value}>
                                    <FormControl>
                                      <SelectTrigger className="h-9 text-xs bg-white/5 border-white/10">
                                        <SelectValue placeholder="Select mode" />
                                      </SelectTrigger>
                                    </FormControl>
                                    <SelectContent>{getStealWayOptions()}</SelectContent>
                                  </Select>
                                  <FormMessage />
                                </FormItem>
                              )}
                            />
                          </div>
                        )}
                      </div>
                    </section>

                    {/* Section: Legal Articles */}
                    <section>
                      <SectionHeader icon={BookOpen} title="Legal Articles" />
                      <p className="text-[10px] text-muted-foreground mb-3 leading-relaxed opacity-80">
                        <strong>Articles of Criminal Code (Članovi Krivičnog zakonika)</strong> are the specific laws violated by the defendant, while <strong>Articles of Indictment (Članovi optužnice)</strong> represent the formal charges brought by the plaintiff.
                      </p>
                      <div className="space-y-3">
                        <FormField
                          name="clanoviKrivicnihDela"
                          render={({ field }) => (
                            <FormItem>
                              <FormLabel className="text-xs text-muted-foreground">Articles of Criminal Code (Članovi Krivičnog zakonika)</FormLabel>
                              <FormControl>
                                <Input {...field} className="h-9 text-xs bg-white/5 border-white/10 font-mono" placeholder="e.g. čl. 242 st. 1" />
                              </FormControl>
                              <FormMessage />
                            </FormItem>
                          )}
                        />
                        <FormField
                          name="clanoviOptuzbe"
                          render={({ field }) => (
                            <FormItem>
                              <FormLabel className="text-xs text-muted-foreground">Articles of Indictment (Članovi optužnice)</FormLabel>
                              <FormControl>
                                <Input {...field} className="h-9 text-xs bg-white/5 border-white/10 font-mono" placeholder="e.g. čl. 226, 229" />
                              </FormControl>
                              <FormMessage />
                            </FormItem>
                          )}
                        />
                      </div>
                    </section>

                    {/* Section: Verdict */}
                    <section>
                      <SectionHeader icon={FileText} title="Verdict" />
                      <div className="space-y-3">
                        <FormField
                          name="sankcija"
                          render={({ field }) => (
                            <FormItem>
                              <FormLabel className="text-xs text-muted-foreground">Guilty for</FormLabel>
                              <FormControl>
                                <Textarea {...field} className="min-h-[80px] text-xs bg-white/5 border-white/10" placeholder="Crime description" />
                              </FormControl>
                              <FormMessage />
                            </FormItem>
                          )}
                        />
                        <FormField
                          name="kazna"
                          render={({ field }) => (
                            <FormItem>
                              <FormLabel className="text-xs text-muted-foreground">Punishment</FormLabel>
                              <FormControl>
                                <Textarea {...field} className="min-h-[80px] text-xs bg-white/5 border-white/10" placeholder="e.g. kaznu zatvora u trajanju od..." />
                              </FormControl>
                              <FormMessage />
                            </FormItem>
                          )}
                        />
                        <FormField
                          name="obrazlozenje"
                          render={({ field }) => (
                            <FormItem>
                              <FormLabel className="text-xs text-muted-foreground">Explanation (Obrazloženje)</FormLabel>
                              <FormControl>
                                <Textarea {...field} className="min-h-[80px] text-xs bg-white/5 border-white/10" placeholder="Optional explanation" />
                              </FormControl>
                              <FormDescription className="text-[10px] opacity-70 mt-1">
                                This field is used to provide the detailed legal reasoning and facts behind the court's decision (Polje se koristi za detaljno objašnjenje pravnih razloga i činjenica na kojima se zasniva sudska odluka).
                              </FormDescription>
                              <FormMessage />
                            </FormItem>
                          )}
                        />
                      </div>
                    </section>
                  </div>
                </ScrollArea>
              </CardContent>

              {/* Footer actions */}
              <CardFooter className="shrink-0 border-t border-white/10 p-4 bg-black/20">
                <div className="w-full flex items-center gap-2">
                  <Button
                    onClick={form.handleSubmit(getCaseBasedReasoning)}
                    variant="outline"
                    type="button"
                    disabled={loadingCbr}
                    className="gap-1.5 text-xs border-purple-500/30 text-purple-300 hover:bg-purple-500/10"
                  >
                    <Search className="w-3.5 h-3.5" />
                    {loadingCbr ? "Searching..." : "Case Reasoning"}
                  </Button>
                  <Button
                    onClick={form.handleSubmit(getRuleBasedReasoning)}
                    variant="outline"
                    type="button"
                    disabled={loadingRbr}
                    className="gap-1.5 text-xs border-blue-500/30 text-blue-300 hover:bg-blue-500/10"
                  >
                    <Scale className="w-3.5 h-3.5" />
                    {loadingRbr ? "Reasoning..." : "Rule Reasoning"}
                  </Button>
                  <div className="flex-grow" />
                  <Button type="submit" className="gap-1.5 text-xs bg-purple-600 hover:bg-purple-500">
                    <Send className="w-3.5 h-3.5" />
                    Submit
                  </Button>
                </div>
              </CardFooter>
            </Card>
          </form>
        </Form>
      </div>

      {/* ── RIGHT: RESULTS ── */}
      <div className="flex-1 flex flex-col gap-4 min-w-0 h-full overflow-hidden">
        {/* Case Based Reasoning panel */}
        <Card className="flex flex-col border-white/10 bg-black/30 backdrop-blur-sm flex-1 min-h-0">
          <CardHeader className="py-3 px-4 border-b border-white/10 shrink-0">
            <div className="flex items-center gap-2">
              <div className="p-1.5 rounded-md bg-purple-500/20">
                <TrendingUp className="w-3.5 h-3.5 text-purple-400" />
              </div>
              <span className="text-sm font-semibold">Case Based Reasoning</span>
              {caseBasedResult.length > 0 && (
                <Badge className="ml-auto bg-purple-500/20 text-purple-300 border-purple-500/30">
                  {caseBasedResult.length} similar {caseBasedResult.length === 1 ? "case" : "cases"}
                </Badge>
              )}
            </div>
          </CardHeader>
          <CardContent className="p-0 flex-1 min-h-0 flex flex-col">
            {loadingCbr ? (
              <div className="flex items-center gap-2 text-xs text-muted-foreground py-2 px-4">
                <div className="w-3 h-3 border-2 border-purple-400 border-t-transparent rounded-full animate-spin" />
                Searching similar cases...
              </div>
            ) : caseBasedResult.length > 0 ? (
              <ScrollArea className="flex-1 min-h-0 w-full" type="always">
                <div className="p-4 pr-5">
                  {caseBasedResult.map((r, i) => (
                    <SimilarCaseCard key={i} caseResult={r} index={i} />
                  ))}
                </div>
              </ScrollArea>
            ) : (
              <p className="text-xs text-muted-foreground py-2 px-4">
                Fill in the form and click <span className="text-purple-300 font-medium">Case Reasoning</span> to find similar cases.
              </p>
            )}
          </CardContent>
        </Card>

        {/* Rule Based Reasoning panel */}
        <Card className="flex flex-col border-white/10 bg-black/30 backdrop-blur-sm flex-1 min-h-[200px]">
          <CardHeader className="py-3 px-4 border-b border-white/10 shrink-0">
            <div className="flex items-center gap-2">
              <div className="p-1.5 rounded-md bg-blue-500/20">
                <Scale className="w-3.5 h-3.5 text-blue-400" />
              </div>
              <span className="text-sm font-semibold">Rule Based Reasoning</span>
            </div>
          </CardHeader>
          <CardContent className="p-0 flex-1 min-h-0 flex flex-col">
            {loadingRbr ? (
              <div className="flex items-center gap-2 text-xs text-muted-foreground py-2 px-4">
                <div className="w-3 h-3 border-2 border-blue-400 border-t-transparent rounded-full animate-spin" />
                Applying rules...
              </div>
            ) : ruleBasedResult ? (
              <ScrollArea className="flex-1 min-h-0 w-full" type="always">
                <div className="p-4 pr-5 h-full">
                  <div className="rounded-lg bg-blue-500/10 border border-blue-500/20 p-3 min-h-full">
                    <p className="text-xs text-blue-200 leading-relaxed font-mono whitespace-pre-wrap">{ruleBasedResult}</p>
                  </div>
                </div>
              </ScrollArea>
            ) : (
              <p className="text-xs text-muted-foreground py-2 px-4">
                Fill in the form and click <span className="text-blue-300 font-medium">Rule Reasoning</span> to see the recommended verdict.
              </p>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
