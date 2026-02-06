---
name: ui-design
description: Opinionated UI design constraints for building high-quality web interfaces. Use this skill when creating React components, building UI features, writing CSS/Tailwind styles, or implementing any frontend interface. Ensures accessibility, performance, and visual consistency.
user-invocable: true
---

# UI Design Skills

Opinionated constraints for building high-quality web interfaces. Follow these rules when generating any UI code.

## Stack & Tooling

- MUST use Tailwind CSS defaults (spacing, radius, shadows) before custom values
- MUST use `cn` utility (`clsx` + `tailwind-merge`) for conditional class logic
- MUST use motion/react (formerly framer-motion) when JavaScript animation is required
- SHOULD use `tw-animate-css` for entrance and micro-animations
- SHOULD prefer CSS animations over JS-driven animations when possible
- NEVER introduce custom design tokens without exhausting existing ones first

## Accessibility & Interactions

### Keyboard & Focus

- MUST ensure all flows are keyboard-operable following WAI-ARIA Authoring Patterns
- MUST show visible focus ring on every focusable element
- MUST use `:focus-visible` over `:focus` to avoid distracting pointer users
- MUST add `aria-label` to icon-only buttons
- NEVER rebuild keyboard or focus behavior by hand unless explicitly requested
- NEVER disable browser zoom

### Hit Targets

- MUST match visual and hit targets; if visual target < 24px, expand hit target to ≥ 24px
- MUST ensure minimum 44px hit targets on mobile
- MUST set `touch-action: manipulation` to prevent double-tap zoom
- NEVER leave dead zones — if it looks interactive, it must be interactive

### Component Primitives

- MUST use accessible component primitives (Base UI, React Aria, Radix) for keyboard/focus behavior
- MUST use the project's existing component primitives first
- NEVER mix primitive systems within the same interaction surface

## Forms

- MUST associate every control with a `<label>`
- MUST show errors next to their fields; focus first error on submit
- MUST set `autocomplete` and meaningful `name` values for autofill
- MUST set `<input>` font size ≥ 16px on mobile to prevent iOS Safari auto-zoom
- SHOULD set placeholder to example value (e.g., `+1 (123) 456-7890`)
- NEVER block paste in `<input>` or `<textarea>` elements
- NEVER block typing — allow any input and show validation feedback

## Loading & States

- MUST show loading indicator on buttons while keeping original label visible
- MUST use structural skeletons that mirror final content exactly
- MUST design all states: empty, sparse, dense, error, and loading
- MUST give empty states one clear next action
- SHOULD add show-delay (~150–300ms) for spinners/skeletons to avoid flicker

## Destructive Actions

- MUST use AlertDialog for destructive or irreversible actions
- MUST require confirmation or provide Undo with a safe window

## Animation

### Principles

- MUST honor `prefers-reduced-motion` with a reduced-motion variant
- MUST pause looping animations when off-screen
- SHOULD use `ease-out` on entrance animations
- NEVER add animation unless explicitly requested
- NEVER exceed 200ms for interaction feedback

### Performance

- MUST animate only compositor props (`transform`, `opacity`)
- MUST explicitly list animated properties — never use `transition: all`
- NEVER animate layout properties (`width`, `height`, `top`, `left`, `margin`, `padding`)
- NEVER animate large `blur()` or `backdrop-filter` surfaces
- NEVER apply `will-change` outside an active animation
- NEVER introduce custom easing curves unless explicitly requested

## Typography

- MUST use `text-balance` for headings and `text-pretty` for body/paragraphs
- MUST use `tabular-nums` for data/numeric comparisons
- SHOULD use `truncate` or `line-clamp` for dense UI
- NEVER modify `letter-spacing` (`tracking-`) unless explicitly requested

## Layout

- MUST ensure every element aligns intentionally (grid, baseline, edge, or optical center)
- MUST respect safe areas with `safe-area-inset` variables
- MUST use fixed z-index scale — no arbitrary `z-[x]` values
- SHOULD use `size-x` for square elements instead of `w-x + h-x`
- SHOULD prefer flex/grid/intrinsic layout over JS measurement
- NEVER use `h-screen` — use `h-dvh` instead

## Navigation & URLs

- MUST use `<a>` or `<Link>` for navigation (not `<button>` or `<div>`)
- MUST persist state in URL for share, refresh, Back/Forward navigation
- MUST deep-link everything: filters, tabs, pagination, expanded panels

## Content & Semantics

- MUST set accurate `<title>` reflecting current context
- MUST provide redundant status cues — don't rely on color alone
- MUST ensure icons have text labels for assistive tech
- MUST prefer native elements (`button`, `a`, `label`, `table`) before `aria-*`
- SHOULD use non-breaking space `&nbsp;` to keep units together: `10&nbsp;MB`

## Performance

- MUST set explicit image dimensions to prevent CLS
- MUST preload only above-the-fold images; lazy-load the rest
- SHOULD virtualize large lists or use `content-visibility: auto`
- SHOULD prefer uncontrolled inputs; make controlled loops cheap

## Visual Design

### Colors & Contrast

- MUST meet minimum contrast — prefer APCA over WCAG 2
- MUST ensure `:hover`, `:active`, `:focus` have more contrast than rest state
- MUST set `color-scheme: dark` on `<html>` in dark themes
- MUST set `<meta name="theme-color">` to match page background
- SHOULD limit accent color to one per view
- SHOULD use existing theme or Tailwind color tokens first

### Borders, Shadows & Radii

- MUST use nested radii (child ≤ parent) so curves align concentrically
- SHOULD use layered shadows mimicking ambient + direct light
- SHOULD use Tailwind default shadow scale unless explicitly requested

### Effects

- NEVER use gradients unless explicitly requested
- NEVER use purple or multicolor gradients
- NEVER use glow effects as primary affordances

## Error Handling

- MUST show errors next to where the action happens
- MUST provide recovery path — tell user how to fix it
- SHOULD frame messages positively, even for errors
