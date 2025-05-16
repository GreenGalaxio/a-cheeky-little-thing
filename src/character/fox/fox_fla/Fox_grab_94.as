// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.Fox_grab_94

package fox_fla
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

    public dynamic class Fox_grab_94 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var target:*;
        public var grab:*;

        public function Fox_grab_94()
        {
            addFrameScript(0, this.frame1, 14, this.frame15, 15, this.frame16, 18, this.frame19, 21, this.frame22, 27, this.frame28, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "grab";
            };
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.xframe = "grab";
            this.target = null;
            this.grab = 0;
            if (this.self.isCPU())
            {
                this.target = this.self.getGrabbedOpponent();
                this.grab = SSF2API.random();
                if (((!(this.target == null)) && (this.target.getDamage() >= 70)))
                {
                    if (this.grab <= 0.7)
                    {
                        this.self.importCPUControls([0x0800, 1]);
                    };
                }
                else
                {
                    if (this.grab <= 0.5)
                    {
                        this.self.importCPUControls([0x0400, 1]);
                    }
                    else
                    {
                        if (this.grab <= 0.75)
                        {
                            this.self.importCPUControls([0x0800, 1]);
                        }
                        else
                        {
                            if (this.grab <= 0.85)
                            {
                                this.self.importCPUControls([4609, 1]);
                            }
                            else
                            {
                                if (this.grab <= 0.95)
                                {
                                    this.self.importCPUControls([4385, 1]);
                                }
                                else
                                {
                                    this.self.importCPUControls([4129, 1]);
                                };
                            };
                        };
                    };
                };
            };
            stop();
        }

        internal function frame19():*
        {
            if (this.self.isCPU())
            {
                this.target = this.self.getGrabbedOpponent();
                this.grab = SSF2API.random();
                if (((!(this.target == null)) && (this.target.getDamage() >= 70)))
                {
                    if (this.grab <= 0.7)
                    {
                        this.self.importCPUControls([0x0800, 1]);
                    };
                }
                else
                {
                    if (this.grab <= 0.5)
                    {
                        this.self.importCPUControls([0x0400, 1]);
                    }
                    else
                    {
                        if (this.grab <= 0.75)
                        {
                            this.self.importCPUControls([0x0800, 1]);
                        }
                        else
                        {
                            if (this.grab <= 0.85)
                            {
                                this.self.importCPUControls([4609, 1]);
                            }
                            else
                            {
                                if (this.grab <= 0.95)
                                {
                                    this.self.importCPUControls([4385, 1]);
                                }
                                else
                                {
                                    this.self.importCPUControls([4129, 1]);
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame22():*
        {
            gotoAndStop("grabbed");
        }

        internal function frame28():*
        {
            this.self.updateAttackBoxStats(1, {"effect_id":"effect_lightHit"});
        }

        internal function frame32():*
        {
            this.gotoAndPlay("grabbed");
        }


    }
}//package fox_fla

