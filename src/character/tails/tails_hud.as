// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_hud

package 
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class tails_hud extends MovieClip 
    {

        public var self:*;

        public function tails_hud()
        {
            addFrameScript(0, this.frame1, 33, this.frame34, 34, this.frame35, 39, this.frame40, 40, this.frame41, 44, this.frame45, 45, this.frame46, 72, this.frame73);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame34():*
        {
            gotoAndPlay("idle");
        }

        internal function frame35():*
        {
            SSF2API.playSound("bullet_small");
        }

        internal function frame40():*
        {
            gotoAndPlay("idle");
        }

        internal function frame41():*
        {
            SSF2API.playSound("bombexplode");
        }

        internal function frame45():*
        {
            gotoAndPlay("idle");
        }

        internal function frame46():*
        {
            this.gotoAndPlay("idle");
        }

        internal function frame73():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

