// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.donkeykong_arcadebarrel_97

package donkeykong_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class donkeykong_arcadebarrel_97 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var changedirection:Boolean;

        public function donkeykong_arcadebarrel_97()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 7, this.frame8, 18, this.frame19);
        }

        public function toContinue(_arg_1:*=null):*
        {
            this.gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.changedirection = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.setPosition(this.self.getX(), (SSF2API.getDeathBounds().y + 1));
                this.self.updateProjectileStats({"ghost":false});
                this.self.addEventListener(SSF2Event.GROUND_TOUCH, this.toContinue);
            };
        }

        internal function frame6():*
        {
            this.gotoAndPlay("fall");
        }

        internal function frame8():*
        {
            if (!this.changedirection)
            {
                if (SSF2API.random() > 0.5)
                {
                    this.self.setXSpeed(7);
                }
                else
                {
                    this.self.setXSpeed(-7);
                };
                this.self.updateProjectileStats({
                    "gravity":1,
                    "maxgravity":15
                });
                SSF2API.playSound("brawl_punch_s");
                this.changedirection = true;
            };
        }

        internal function frame19():*
        {
            this.gotoAndPlay("continue");
        }


    }
}//package donkeykong_fla

