// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_Hurt_54

package bomberman_fla
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

    public dynamic class Bomberman_Hurt_54 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var projectile:*;
        public var xframe:String;

        public function Bomberman_Hurt_54()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 8, this.frame9, 9, this.frame10, 10, this.frame11, 16, this.frame17, 17, this.frame18);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.projectile = this.self.getGlobalVariable("bombCharge");
                if (this.projectile != null)
                {
                    this.projectile.destroy();
                };
                this.self.setGlobalVariable("bombCharge", null);
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
            this.xframe = "hurt1";
        }

        internal function frame4():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame5():*
        {
            gotoAndStop("done1");
        }

        internal function frame6():*
        {
            this.projectile = this.self.getGlobalVariable("bombCharge");
            if (this.projectile != null)
            {
                this.projectile.destroy();
            };
            this.self.setGlobalVariable("bombCharge", null);
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            this.xframe = "hurt2";
        }

        internal function frame9():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame10():*
        {
            gotoAndStop("done2");
        }

        internal function frame11():*
        {
            this.projectile = this.self.getGlobalVariable("bombCharge");
            if (this.projectile != null)
            {
                this.projectile.destroy();
            };
            this.self.setGlobalVariable("bombCharge", null);
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            this.xframe = "hurt3";
        }

        internal function frame17():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame18():*
        {
            gotoAndStop("done3");
        }


    }
}//package bomberman_fla

