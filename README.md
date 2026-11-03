# cv-sender-agent

Agente de [Claude Code](https://claude.com/claude-code) que te ayuda a buscar trabajo y enviar tu CV por Gmail: busca puestos, los analiza, compara tu CV contra cada uno, te recomienda si postular y redacta el mail. **Nunca envía nada sin que le confirmes ese mail puntual.**

## Qué hace

1. Busca puestos según tu perfil (`~/job-hunter/perfil.md`).
2. Analiza cada oferta: requisitos, stack, modalidad y señales de estafa.
3. Puntúa tu CV contra la oferta (0-100) con coincidencias y brechas reales, sin inventar experiencia.
4. Recomienda: postular, postular con ajustes o descartar.
5. Redacta un mail breve y, si hace falta, una versión adaptada del CV.
6. Te muestra el mail completo y espera tu "sí" antes de enviarlo (o lo deja como borrador en Gmail).
7. Registra todo en `~/job-hunter/postulaciones.md`.

## Requisitos

- [Claude Code](https://docs.claude.com/en/docs/claude-code) instalado y con sesión iniciada.
- Cuenta de Claude con el **conector de Gmail** habilitado (claude.ai → Configuración → Conectores → Gmail). Sin esto, el agente puede buscar y analizar, pero no enviar ni crear borradores.
- macOS o Linux (en Windows, ver instalación manual).

## Instalación

### Automática (macOS / Linux)

```bash
git clone https://github.com/t3co5900/cv-sender-agent.git
cd cv-sender-agent
./install.sh
```

El script copia el agente a `~/.claude/agents/job-hunter.md` y crea `~/job-hunter/` con las plantillas. No pisa tus archivos si ya existen.

### Manual (cualquier sistema, incluido Windows)

1. Copiá `agents/job-hunter.md` a la carpeta `.claude/agents/` de tu usuario (`%USERPROFILE%\.claude\agents\` en Windows). Creala si no existe.
2. Creá la carpeta `job-hunter/cv/` en tu carpeta personal y copiá ahí `plantillas/perfil.md` y `plantillas/postulaciones.md` a `job-hunter/`.

> En Windows las rutas `~/job-hunter/` del agente se resuelven a tu carpeta de usuario; si algo no las encuentra, pedile al agente la ruta exacta o decile dónde dejaste tu CV.

## Configuración

1. Copiá tu CV (PDF, DOCX o MD) a `~/job-hunter/cv/`.
2. Completá `~/job-hunter/perfil.md` (rol, seniority, modalidad, país, tecnologías). Si lo dejás vacío, el agente te hace unas preguntas y lo completa.
3. Conectá Gmail en Claude (ver requisitos).

## Uso

Abrí Claude Code (`claude`) y pedí, por ejemplo:

- `Usá el agente job-hunter para buscar puestos para mí`
- `Con job-hunter, analizá esta oferta contra mi CV: <link>`
- `Preparame la postulación a esta oferta y dejala como borrador en Gmail`

Verificá que el agente está disponible con `/agents`.

## Seguridad y privacidad

- Cada envío requiere tu confirmación explícita; una aprobación anterior no cubre otros envíos.
- Solo escribe a direcciones que figuren en la oferta o en el sitio oficial de la empresa. Sin envíos masivos.
- No entrega datos sensibles (DNI, CUIL, cuentas bancarias) y avisa si una oferta los pide.
- Tu CV y tu perfil viven solo en tu computadora (`~/job-hunter/`); este repo no los incluye. **No subas tu CV ni tus datos a un repo público.**

## Personalización

El agente es un archivo Markdown: editá `~/.claude/agents/job-hunter.md` para cambiar el tono de los mails, el modelo (`model: sonnet`) o las reglas.

## Licencia

MIT. Ver [LICENSE](LICENSE).
