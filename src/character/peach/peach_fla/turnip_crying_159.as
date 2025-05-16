// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.turnip_crying_159

package peach_fla
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

    public dynamic class turnip_crying_159 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var turnipStats:String;
        public var character:*;

        public function turnip_crying_159()
        {
            addFrameScript(0, this.frame1, 26, this.frame27);
        }

        public function facingDir():void
        {
            if (this.self.getXSpeed() == 0)
            {
                this.self.updateAttackBoxStats(1, {
                    "reversableAngle":true,
                    "direction":30
                });
                this.turnipStats = "thrown vertical";
            }
            else
            {
                if (!this.self.isFacingRight())
                {
                    this.self.updateAttackBoxStats(1, {
                        "reversableAngle":false,
                        "direction":150
                    });
                    this.turnipStats = "thrown left";
                }
                else
                {
                    this.self.updateAttackBoxStats(1, {
                        "reversableAngle":false,
                        "direction":30
                    });
                    this.turnipStats = "thrown right";
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getItem(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.turnipStats = null;
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.createTimer(this.self, 1, -1, this.facingDir);
            };
        }

        internal function frame27():*
        {
            gotoAndPlay("toss");
        }


    }
}//package peach_fla

