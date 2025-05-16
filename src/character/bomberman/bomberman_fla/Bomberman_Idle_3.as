// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_Idle_3

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

    public dynamic class Bomberman_Idle_3 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var target:*;
        public var rand:*;

        public function Bomberman_Idle_3()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.target = this.self.getCPUTarget();
                this.rand = (SSF2API.random() * 100);
                if ((((((((((this.target == null) || (this.target.getX() > (this.self.getX() + 500))) || (this.target.getY() > (this.self.getY() + 500))) || (this.target.getX() < (this.self.getX() - 500))) || (this.target.getY() < (this.self.getY() - 500))) || (this.target.inUpperLeftWarningBounds())) || (this.target.inUpperRightWarningBounds())) || (this.target.inLowerLeftWarningBounds())) || (this.target.inLowerRightWarningBounds())))
                {
                    if (((this.self.getCPUForcedAction() == -1) || (this.self.getCPUForcedAction() == 5)))
                    {
                        if (((this.rand >= 34) && (this.rand <= 50)))
                        {
                            this.self.importCPUControls([64, 1, 0x0400, 7]);
                        };
                        if (((this.rand >= 17) && (this.rand < 34)))
                        {
                            this.self.importCPUControls([64, 31, 0x0400, 7]);
                        };
                        if (((this.rand >= 0) && (this.rand < 17)))
                        {
                            this.self.importCPUControls([64, 55, 0x0400, 7]);
                        };
                    };
                };
            };
        }


    }
}//package bomberman_fla

