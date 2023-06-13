[top]
components : ambiente
in : inPort
link : inPort inputPresion@ambiente

[ambiente]
type : cell
dim : (3, 4, 4, 4)
delay : transport
defaultDelayTime  : 100
border : wrapped 
neighbors : ambiente(0,-1,-1,-1) ambiente(0,-1,-1,0) ambiente(0,-1,-1,1)
neighbors : ambiente(0,-1,0,-1)  ambiente(0,-1,0,0)  ambiente(0,-1,0,1)
neighbors : ambiente(0,-1,1,-1)  ambiente(0,-1,1,0)  ambiente(0,-1,1,1)

neighbors : ambiente(0,0,-1,-1)  ambiente(0,0,-1,0)  ambiente(0,0,-1,1)
neighbors : ambiente(0,0,0,-1)   ambiente(0,0,0,0)   ambiente(0,0,0,1)
neighbors : ambiente(0,0,1,-1)   ambiente(0,0,1,0)   ambiente(0,0,1,1)

neighbors : ambiente(0,1,-1,-1)  ambiente(0,1,-1,0)  ambiente(0,1,-1,1)
neighbors : ambiente(0,1,0,-1)   ambiente(0,1,0,0)   ambiente(0,1,0,1)
neighbors : ambiente(0,1,1,-1)   ambiente(0,1,1,0)   ambiente(0,1,1,1)

neighbors : ambiente(-1,0,0,0)
neighbors : ambiente(1,0,0,0)

initialvalue : 0
in : inputPresion
link : inputPresion in@ambiente(0,1,1,0)
localtransition : presion-rule
initialCellsValue : mosquitov2.val
zone : temp-rule { (1,0,0,0)..(1,3,3,3) }
zone : mosquito-rule { (2,0,0,0)..(2,3,3,3) }
portInTransition : in@ambiente(0,1,1,0)  setPresion




[setPresion]
rule : { uniform(0.1,1.3) } 0 { t }

[presion-rule]
rule : { ( (0,-1,-1,-1) + (0,-1,-1,0) + (0,-1,-1,1) + (0,-1,0,-1) + (0,-1,0,0) + (0,-1,0,1) + (0,-1,1,-1) + (0,-1,1,0) + (0,-1,1,1) + (0,0,-1,-1) + (0,0,-1,0) + (0,0,-1,1) + (0,0,0,-1) + (0,0,0,0) + (0,0,0,1) + (0,0,1,-1) + (0,0,1,0) + (0,0,1,1) + (0,1,-1,-1) + (0,1,-1,0) + (0,1,-1,1) + (0,1,0,-1) + (0,1,0,0) + (0,1,0,1) + (0,1,1,-1) + (0,1,1,0) + (0,1,1,1) ) / 27 } 1000 { t }

[temp-rule]
rule : { 273 * ( (-1,0,0,0) - 1 ) + 20 } 1000 { t }

[mosquito-rule]
rule : 1 1000 { (0,0,0,-1) = 1 AND (-1,0,0,0) >= 16 }
rule : 0 1000 { t }
