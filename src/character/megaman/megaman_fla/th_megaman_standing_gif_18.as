// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.th_megaman_standing_gif_18

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class th_megaman_standing_gif_18 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var used:Boolean;
        public var idle_repeat:*;
        public var wp:int;
        public var chance:Number;
        public var current:Number;

        public function th_megaman_standing_gif_18()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 24, this.frame25, 48, this.frame49, 94, this.frame95);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.used = false;
            this.idle_repeat = 0;
            this.wp = 0;
            this.chance = 0;
            this.current = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setAttackEnabled(true, "b_down_air");
                this.self.setAttackEnabled(true, "b_down");
                this.used = this.self.getGlobalVariable("usedCrashBomb");
                if (!this.used)
                {
                    this.self.setGlobalVariable("crashBomb", 0);
                    this.self.setGlobalVariable("usedCrashBomb", true);
                };
                if (this.self.isCPU())
                {
                    this.self.resetCPUControls();
                };
            };
        }

        internal function frame2():*
        {
            if (this.idle_repeat == 0)
            {
                this.chance = 0;
                this.wp = (SSF2API.random() * 5);
                if (((((this.self) && (this.self.isCPU())) && (SSF2API.random() < 0.2)) && (this.self.getCPULevel() >= 7)))
                {
                    if (((this.self.getCPUForcedAction() == -1) || (this.self.getCPUForcedAction() == 5)))
                    {
                        this.current = this.self.getGlobalVariable("weapon");
                        if (((this.wp == 0) && (!(this.current == 0))))
                        {
                            this.self.importCPUControls([1088, 2, 64, 2, 0, 1]);
                        }
                        else
                        {
                            if (((this.wp == 1) && (!(this.current == 1))))
                            {
                                this.self.importCPUControls([1088, 2, 64, 2, 2112, 2, 0x0800, 1]);
                            }
                            else
                            {
                                if (((this.wp == 2) && (!(this.current == 2))))
                                {
                                    if (this.self.isFacingRight())
                                    {
                                        this.self.importCPUControls([1088, 2, 64, 2, 320, 2, 0x0100, 1]);
                                    }
                                    else
                                    {
                                        this.self.importCPUControls([1088, 2, 64, 2, 576, 2, 0x0200, 1]);
                                    };
                                }
                                else
                                {
                                    if (((this.wp == 3) && (!(this.current == 3))))
                                    {
                                        if (!this.self.isFacingRight())
                                        {
                                            this.self.importCPUControls([1088, 2, 64, 2, 320, 2, 0x0100, 1]);
                                        }
                                        else
                                        {
                                            this.self.importCPUControls([1088, 2, 64, 2, 576, 2, 0x0200, 1]);
                                        };
                                    }
                                    else
                                    {
                                        if (((this.wp == 4) && (!(this.current == 4))))
                                        {
                                            this.self.importCPUControls([1088, 2, 0x0400, 1]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame25():*
        {
            if (this.idle_repeat == 1)
            {
                gotoAndPlay("blink");
            }
            else
            {
                if (this.idle_repeat >= 3)
                {
                    this.idle_repeat = 0;
                    gotoAndPlay("look");
                }
                else
                {
                    this.idle_repeat++;
                    gotoAndPlay("repeat");
                };
            };
        }

        internal function frame49():*
        {
            if (this.idle_repeat >= 3)
            {
                this.idle_repeat = 0;
                gotoAndPlay("look");
            }
            else
            {
                this.idle_repeat++;
                gotoAndPlay("repeat");
            };
        }

        internal function frame95():*
        {
            gotoAndPlay("repeat");
        }


    }
}//package megaman_fla

