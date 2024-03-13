/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/**/*.{js,ts,jsx,tsx}", "./components/**/*.{js,ts,jsx,tsx}", "./utils/**/*.{js,ts,jsx,tsx}"],
  plugins: [require("daisyui")],
  darkTheme: "dark",
  // DaisyUI theme colors
  daisyui: {
    themes: [
      {
        light: {
<<<<<<< HEAD
          primary: "#FFBCCA",
          "primary-content": "#FD6183",
          secondary: "#FF9CAF",
          "secondary-content": "#212638",
          accent: "#C94763",
          "accent-content": "#212638",
          neutral: "#212638",
          "neutral-content": "#ffffff",
          "base-100": "#FFD6DE",
          "base-200": "#FFC9E6",
          "base-300": "#FF9CAF",
          "base-content": "#212638",
          info: "#C94763",
=======
          primary: "#93BBFB",
          "primary-content": "#1C2F33",
          secondary: "#DAE8FF",
          "secondary-content": "#1C2F33",
          accent: "#93BBFB",
          "accent-content": "#1C2F33",
          neutral: "#1C2F33",
          "neutral-content": "#ffffff",
          "base-100": "#ffffff",
          "base-200": "#f4f8ff",
          "base-300": "#DAE8FF",
          "base-content": "#1C2F33",
          info: "#93BBFB",
>>>>>>> 65f0de4a6c5b42e58bbf25e694655461309edcb3
          success: "#34EEB6",
          warning: "#FFCF72",
          error: "#FF8863",

          "--rounded-btn": "999rem",

          ".tooltip": {
            "--tooltip-tail": "6px",
          },
          ".link": {
            textUnderlineOffset: "2px",
          },
          ".link:hover": {
            opacity: "80%",
          },
        },
      },
      {
        dark: {
<<<<<<< HEAD
          primary: "#323A1F",
=======
          primary: "#1C2F33",
>>>>>>> 65f0de4a6c5b42e58bbf25e694655461309edcb3
          "primary-content": "#F9FBFF",
          secondary: "#3C4427",
          "secondary-content": "#F9FBFF",
<<<<<<< HEAD
          accent: "#B9F824", // Accent color for font fields in
          "accent-content": "#4F5346",
          neutral: "#4F5346",
          "neutral-content": "#385183",
          "base-100": "#93A566",
          "base-200": "#647734",
          "base-300": "#323A1F",
=======
          accent: "#4969A6",
          "accent-content": "#F9FBFF",
          neutral: "#F9FBFF",
          "neutral-content": "#2C7973",
          "base-100": "#2C7973",
          "base-200": "#362B57",
          "base-300": "#1C2F33",
>>>>>>> 65f0de4a6c5b42e58bbf25e694655461309edcb3
          "base-content": "#F9FBFF",
          info: "#2C7973",
          success: "#34EEB6",
          warning: "#FFCF72",
          error: "#FF8863",

          "--rounded-btn": "9999rem",

          ".tooltip": {
            "--tooltip-tail": "6px",
            "--tooltip-color": "oklch(var(--p))",
          },
          ".link": {
            textUnderlineOffset: "2px",
          },
          ".link:hover": {
            opacity: "80%",
          },
        },
      },
    ],
  },
  theme: {
    extend: {
      boxShadow: {
        center: "0 0 12px -2px rgb(0 0 0 / 0.05)",
      },
      animation: {
        "pulse-fast": "pulse 1s cubic-bezier(0.4, 0, 0.6, 1) infinite",
      },
    },
  },
};
