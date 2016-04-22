package core

//import "math/big"

type MultiplierB2 uint64

const (
	ONE  MultiplierB2 = 1
	KILO              = 1024
	MEGA              = KILO * KILO
	GIGA              = KILO * MEGA
	TERA              = KILO * GIGA
	PETA              = KILO * TERA
	EXA               = KILO * PETA
	ZETA              = KILO * EXA
	YOTA              = KILO * ZETA
)

type MultiplierB10 uint64

const (
	one  MultiplierB10 = 1
	kilo               = 1000
	mega               = kilo * kilo
	giga               = kilo * mega
	tera               = kilo * giga
	peta               = kilo * tera
	exa                = kilo * peta
	zeta               = kilo * exa
	yota               = kilo * zeta
)

type BitSize uint64
type BitRate BitSize

const (
	by BitSize = 1         // 1 bit
	kb         = KILO      // 1 Kilo-Bit
	mb         = KILO * kb // 1 Mega-Bit
	gb         = KILO * mb // 1 Giga-Bit
	tb         = KILO * gb // 1 Tera-Bit
	pb         = KILO * tb // 1 Peta-Bit
	eb         = KILO * pb // 1 Exa-Bit
	zb         = KILO * eb // 1 Zetta-Bit (check)
	yb         = KILO * zb // 1 Yota-Bit (check)
)

type ByteSize uint64

const (
	BY ByteSize = 1         // 1 Byte
	KB          = KILO      // 1 Kilo-Bytes
	MB          = KILO * KB // 1 Mega-Bytes
	GB          = KILO * MB // 1 Giga-Bytes
	TB          = KILO * GB // 1 Tera-Bytes
	PB          = KILO * TB // 1 Peta-Bytes
	EB          = KILO * PB // 1 Exa-Bytes
	ZB          = KILO * EB // 1 Zetta-Bytes (check)
	YB          = KILO * ZB // 1 Yota-Bytes (check)
)

type StorageSpace ByteSize
type MemorySpace ByteSize

type Hertz uint64

const (
	HZ Hertz = 1         // 1 Hertz
	KZ       = 1024      // 1 Kilo-Hertz
	MZ       = 1024 * KZ // 1 Mega-Hertz
	GZ       = 1024 * MZ // 1 Giga-Hertz
	TZ       = 1024 * GZ // 1 Tera-Hertz
	PZ       = 1024 * TZ // 1 Peta-Hertz
	EZ       = 1024 * PZ // 1 Exa-Hertz
	ZZ       = 1024 * EZ // 1 Zetta-Hertz (check) // overflows
	YZ       = 1024 * ZZ // 1 Yota-Hertz (check)  // overflows
)
