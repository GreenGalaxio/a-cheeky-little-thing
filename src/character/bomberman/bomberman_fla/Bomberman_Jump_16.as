// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_Jump_16

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Bomberman_Jump_16 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function Bomberman_Jump_16()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame15():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package bomberman_fla

