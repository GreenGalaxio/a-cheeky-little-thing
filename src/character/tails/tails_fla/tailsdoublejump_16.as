// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsdoublejump_16

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class tailsdoublejump_16 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function tailsdoublejump_16()
        {
            addFrameScript(0, this.frame1, 23, this.frame24);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame24():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package tails_fla

