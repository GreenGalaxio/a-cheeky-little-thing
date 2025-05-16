// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//dairsparkle

package 
{
    import flash.display.MovieClip;

    public dynamic class dairsparkle extends MovieClip 
    {

        public function dairsparkle()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

